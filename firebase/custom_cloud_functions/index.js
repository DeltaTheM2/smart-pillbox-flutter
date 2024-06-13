const admin = require("firebase-admin/app");
admin.initializeApp();

const checkPillReminders = require("./check_pill_reminders.js");
exports.checkPillReminders = checkPillReminders.checkPillReminders;
