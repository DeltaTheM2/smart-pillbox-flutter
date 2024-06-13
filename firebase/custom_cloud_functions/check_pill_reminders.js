const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Scheduled function that checks every 5 minutes (as an example)
exports.checkPillReminders = functions.pubsub
  .schedule("every 5 minutes")
  .onRun(async (context) => {
    const currentTime = Math.floor(Date.now() / 1000); // current time in UNIX seconds
    const upcomingLimit = currentTime + 1800; // 30 minutes from now in UNIX seconds

    const pillsSnapshot = await admin.firestore().collection("pills").get();
    const notifications = [];

    pillsSnapshot.forEach((doc) => {
      const pill = doc.data();
      const lastTakenTime = pill.med_history[pill.med_history.length - 1]; // last element in med_history
      const nextReminderTime = lastTakenTime + pill.reminder * 3600; // reminder converted from hours to seconds

      if (nextReminderTime <= upcomingLimit) {
        // Prepare notification if next reminder time is within 30 minutes
        const payload = {
          notification: {
            title: "Time to Take Your Medicine",
            body: `It's time to take your ${pill.name}.`,
          },
          token: pill.userToken, // Assuming the user's device token is stored
        };

        notifications.push(admin.messaging().send(payload));
      }
    });

    return Promise.all(notifications)
      .then((results) => {
        console.log("All notifications sent successfully", results);
      })
      .catch((error) => {
        console.log("Error sending notifications", error);
      });
  });
