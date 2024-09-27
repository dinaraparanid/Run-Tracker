import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:run_tracker/system/sprint/task_handler.dart';

const _serviceChannelId = 'sprint_foreground_service';
const _serviceChannelName = 'Sprint Foreground Service';

final sprintTaskInteractorProvider = Provider((ref) => const SprintTaskInteractor());

final class SprintTaskInteractor {
  const SprintTaskInteractor();

  static const pauseButtonId = 'btn_pause';
  static const resumeButtonId = 'btn_resume';
  static const stopButtonId = 'btn_stop';

  void initService() => FlutterForegroundTask.init(
    androidNotificationOptions: AndroidNotificationOptions(
      channelId: _serviceChannelId,
      channelName: _serviceChannelName,
      channelImportance: NotificationChannelImportance.HIGH,
      priority:  NotificationPriority.HIGH,
    ),
    iosNotificationOptions: const IOSNotificationOptions(),
    foregroundTaskOptions: ForegroundTaskOptions(
      eventAction: ForegroundTaskEventAction.once(),
    ),
  );

  Future<void> startService({
    required String notificationTitle,
    required String notificationText,
    required String pauseButtonTitle,
    required String stopButtonTitle,
  }) async => await FlutterForegroundTask.startService(
      notificationTitle: notificationTitle,
      notificationText: notificationText,
      notificationButtons: [
        NotificationButton(
          id: pauseButtonId,
          text: pauseButtonTitle,
        ),

        NotificationButton(
          id: stopButtonId,
          text: stopButtonTitle,
        ),
      ],
      callback: startSprintTaskCallback,
  );

  Future<void> pauseSprint({
    required String notificationTitle,
    required String notificationText,
    required String resumeButtonTitle,
    required String stopButtonTitle,
  }) async => await FlutterForegroundTask.updateService(
      notificationTitle: notificationTitle,
      notificationText: notificationText,
      notificationButtons: [
        NotificationButton(
          id: resumeButtonId,
          text: resumeButtonTitle,
        ),
        NotificationButton(
          id: stopButtonId,
          text: stopButtonTitle,
        ),
      ],
      callback: pauseSprintTaskCallback,
  );

  Future<void> resumeSprint({
    required String notificationTitle,
    required String notificationText,
    required String pauseButtonTitle,
    required String stopButtonTitle,
  }) async => await FlutterForegroundTask.updateService(
    notificationTitle: notificationTitle,
    notificationText: notificationText,
    notificationButtons: [
      NotificationButton(
        id: pauseButtonId,
        text: pauseButtonTitle,
      ),
      NotificationButton(
        id: stopButtonId,
        text: stopButtonTitle,
      ),
    ],
    callback: resumeSprintTaskCallback,
  );

  Future<void> stopSprint({
    required String notificationTitle,
    required String notificationText,
  }) async => await FlutterForegroundTask.updateService(
    notificationTitle: notificationTitle,
    notificationText: notificationText,
    callback: stopSprintTaskCallback,
  );

  void registerReceiver(DataCallback onReceive) =>
      FlutterForegroundTask.addTaskDataCallback(onReceive);

  void unregisterReceiver(DataCallback onReceive) =>
      FlutterForegroundTask.removeTaskDataCallback(onReceive);
}
