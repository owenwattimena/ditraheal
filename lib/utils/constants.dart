part of "utils.dart";

const String BASE_URL = 'http://206.189.41.75';
// const String BASE_URL = 'http://192.168.1.12/ditraheal/public';
const String BASE_API_URL = BASE_URL + '/api/v1';

const String LOGIN_URL = BASE_URL + '/login';
const String USER_URL = BASE_API_URL + '/user';
const String CHECK_TOKEN_URL = BASE_URL + '/whoami?by_token=';
const String HOBBIES_URL = BASE_API_URL + '/references/hobi';
const String FB_FOLLOWER_URL = BASE_API_URL + '/fb-follower';
const String IDENTITIES_URL = BASE_API_URL + '/identies';
const String TRAUMA_QUESTION_URL = BASE_API_URL + '/references/level_trauma';
const String EFFICATION_QUESTION_URL = BASE_API_URL + '/references/tes_efikasi';
const String PERIODE_TREATMENT_URL = BASE_API_URL + "/periode/treatment";

const String PRE_TES_LEVEL_TRAUMA_URL = BASE_API_URL + "/pre_test/level_trauma?periode_treatment_id=";
const String PRE_TES_EFFICATION_URL = BASE_API_URL + "/pre_test/efikasi?periode_treatment_id=";

const String PRE_TEST_SCORE = BASE_API_URL + "/pre_test/skor";
const String PRE_UPDATE_SCORE = BASE_API_URL + "/pre_test/update_skor";
const String POST_TREATMENT = BASE_API_URL + "/treatments?periode_treatment_id=";

const String DAYLI_TREATMENT = BASE_API_URL + "/treatments/daily?periode_treatment_id=";
const String CHECKLIST_TREATMENT = BASE_API_URL + "/treatments/daily/treat";

const String TREAT_KEL_SEKALI = BASE_API_URL + "/treatments/kelompok/sekali?periode_treatment_id=";
const String CHECLIST_TREAT_KEL_SEKALI = BASE_API_URL + "/treatments/kelompok?jenis_treat_kelompok=sekali&id="; 

const String TREAT_KEL_BERULANG = BASE_API_URL + "/treatments/kelompok/berulang?periode_treatment_id=";
const String CHECLIST_TREAT_KEL_BERULANG = BASE_API_URL + "/treatments/kelompok?id="; 

const String VALIDASI_BEFORE_POST_TEST = BASE_API_URL + "/post_test/validasi?periode_treatment_id=";
const String POST_TEST_EFFICATION = BASE_API_URL + "/post_test/efikasi?periode_treatment_id=";
const String POST_UPDATE_SCORE = BASE_API_URL + "/post_test/update_skor?periode_treatment_id=";


const int REQUEST_SUCCESS = 200;
const int UNAUTHORIZED = 203;
const int INTERNET_ERROR = 503;
const int REQUEST_TIME = 120;

