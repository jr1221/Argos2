const String BACKEND_URI_KEY = 'v1_BackendUri';
const String BACKEND_URI_DEFAULT = 'http://192.168.100.11:8000';
const String MQTT_URI_KEY = 'v1_MqttUri';
const String MQTT_URI_DEFAULT = 'mqtt://192.168.100.11:1883';
const String FAVORITE_TOPICS_KEY = 'v2_FavTopics';
const List<String> FAVORITE_TOPICS_DEFAULT = <String>[];

const String DASHBOARD_LIST_KEY = 'v1_DashboardList';
const String DASHBOARD_TOPICS_KEY_PREFIX = 'v1_Dash_Topics_';
const String DASHBOARD_AXIS_CNT_KEY_PREFIX = 'v1_Axis_Cnt_';

/// stored as int, number of seconds
const String LIVE_GRAPH_DURATION_KEY = 'v1_LiveGraphDur';
const int LIVE_GRAPH_DURATION_DEFAULT = 60;
