import 'package:traccar_flutter/entity/traccar_configs.dart';
import 'package:traccar_flutter/traccar_flutter.dart';
import 'package:unique_identifier/unique_identifier.dart';

class DeviceInfoService {
  static Future<String?> getDeviceId() async {
    String? deviceId;
    try {
      deviceId = await UniqueIdentifier.serial;
    } catch (e) {
      print('Error al obtener el identificador único: $e');
      deviceId = null;
    }
    return deviceId;
  }
}

Future<void> initConfigTracking() async {
  final deviceId = await DeviceInfoService.getDeviceId();
  if (deviceId != null) {
    final traccar = TraccarFlutter();
    // Initialize the service
    await traccar.initTraccar();
    final configs = TraccarConfigs(
      deviceId: deviceId,
      serverUrl: 'http://24.144.100.79:8082/',
      interval: 10000, // Enviar actualizaciones cada 15 segundos
      distance: 10, // Enviar actualizaciones tras un desplazamiento de 10 metros
      angle: 30, // Enviar actualizaciones al cambiar de dirección 30 grados
      accuracy: AccuracyLevel.high, // Usar modo de alta precisión
      offlineBuffering: true, // Habilitar almacenamiento de datos sin conexión
      wakelock: true, // Mantener el dispositivo activo
      notificationIcon: 'custom_icon', // Icono de notificación opcional
    );
    await traccar.setConfigs(configs);
    await traccar.startService();
  } else {
    print('No se pudo obtener el Device ID.');
  }
}