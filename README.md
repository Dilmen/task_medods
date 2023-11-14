# MEDOD task

Модели

* Пациент (ФИО, дата рождения, номер телефона, email) - Patient (full_name:string birthday:date phone_number:integer email:string)

* Запрос на консультацию (пациент, текст запроса, дата создания) - ConsultationRequest (patient_id:string text_query:text)

* Рекомендация (запрос на консультацию, текст рекомендации) - Recommendation (consultation_request_id:string text_recommendation:text)

Endpoint

* POST /consultation_requests - создание запроса на консультацию

* POST /consultation_requests/:request_id/recommendations - создание рекомендации для конкретного запроса на консультацию

* GET /patients/:patient_id/recommendations - получение списка рекомендаций для конкретного пациента

Подключение к API OPENFDA

* GET /consultation_requests/analyze

Связи между таблицами

* таблица модели Patient имеет связь с таблицей модели ConsultationRequest типа один-ко-многим

* таблица модели Patient имеет связь с таблицей модели Recommendation через ConsultationRequest типа один-ко-многим

* таблица модели ConsultationRequest имеет связь с таблицей модели Patient типа один-к-одному

* таблица модели ConsultationRequest имеет связь с таблицей модели Recommendation по типу ссылки

* таблица модели Recommendation имеет связь с таблицей модели ConsultationRequest типа один-к-одному
