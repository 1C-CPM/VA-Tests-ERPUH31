﻿#language: ru
@tree

@ERPUH31_NSI

Функционал: 2. Планировние и лимитирование. Оперативные планы

	Как бизнес-аналитик я хочу
	проверить работоспособность документов опеативного планирования
	чтобы исключить ошибки установки лимитов, резервирования и планирования

Контекст:

	И я подключаю TestClient "ЕРПУХ 3.1 ТЕСТ" логин "Администратор" пароль ""
	И Я закрыл все окна клиентского приложения

Сценарий: 2.1. Проведение оперативного плана при выключенной константе "Автоматически актуализировать показатели бюджетов и проектов".

	* Снимаем флаг "Автоматически актуализировать показатели бюджетирования"
		
		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Бюджетирование, отчетность и анализ'
		Когда открылось окно 'Бюджетирование, отчетность и анализ'
		И я снимаю флаг с именем "АктуализироватьПоказателиБюджетированияРезервФакт"
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна "Бюджетирование, отчетность и анализ *" в течение 20 секунд 
		
	* Проведем оперативный план по этапу проекта
		
		И В командном интерфейсе я выбираю 'Казначейство' 'Операционные планы'
		Когда открылось окно 'Операционные планы'
		И в таблице "Список" я перехожу к строке:
			| 'Вариант настройки' | 'Дата'                | 'Предназначение'                   | 'Номер'     | 'Валюта документа' | 'Период отчета'              | 'Период отчета окончание'    | 'Вид операции'   | 'Сумма документа' | 'Баланс корректировок' | 'Следующий документ' | 'ЦФО'                   | 'Проект'            | 'Организация' | 'Контрагент' | 'Договор контрагента' | 'Состояние согласования' | 'Комментарий'            | 'Предыдущий документ' |
			| 'Бюджет ДДС'        | '05.10.2020 12:40:31' | 'Бюджет движения денежных средств' | '000000020' | 'USD'              | '1 квартал 2021 г.'          | '4 квартал 2021 г.'          | 'Лимиты'         | '10 000 000,00'   | '10 000 000,00'        | ''                   | 'ЦФО Солнечная система' | 'Проект "Ангар 18"' | ''            | ''           | ''                    | 'Утвержден'              | ''                       | ''                    |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты * от *'
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Операционный план: Лимиты * от *' в течение 20 секунд
		#вот тут, если не исправили, вывалится ошибка проведения
		Тогда я закрываю окно 'Операционные планы'
		И я жду закрытия окна 'Операционные планы' в течение 20 секунд
		
	* Отменим проведение оперативного плана
		
		И В командном интерфейсе я выбираю 'Казначейство' 'Операционные планы'
		Когда открылось окно 'Операционные планы'
		И в таблице "Список" я перехожу к строке:
			| 'Вариант настройки' | 'Дата'                | 'Предназначение'                   | 'Номер'     | 'Валюта документа' | 'Период отчета'              | 'Период отчета окончание'    | 'Вид операции'   | 'Сумма документа' | 'Баланс корректировок' | 'Следующий документ' | 'ЦФО'                   | 'Проект'            | 'Организация' | 'Контрагент' | 'Договор контрагента' | 'Состояние согласования' | 'Комментарий'            | 'Предыдущий документ' |
			| 'Бюджет ДДС'        | '05.10.2020 12:40:31' | 'Бюджет движения денежных средств' | '000000020' | 'USD'              | '1 квартал 2021 г.'          | '4 квартал 2021 г.'          | 'Лимиты'         | '10 000 000,00'   | '10 000 000,00'        | ''                   | 'ЦФО Солнечная система' | 'Проект "Ангар 18"' | ''            | ''           | ''                    | 'Утвержден'              | ''                       | ''                    |
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюОтменаПроведения' на элементе формы с именем "Список"
		И я выбираю пункт контекстного меню с именем 'СписокКонтекстноеМенюПровести' на элементе формы с именем "Список"
		И Я закрываю окно 'Операционные планы'

Сценарий 2.2. ОП (Лимиты) при включенной константе 'Актулизировать показатели бюджетов и резервов'

	* Включаем константу 'Актулизировать показатели бюджетов и резервов'

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Бюджетирование, отчетность и анализ'
		Тогда открылось окно 'Бюджетирование, отчетность и анализ'
		И я устанавливаю флаг 'Автоматически актуализировать показатели бюджетирования по сценариям \"Резерв\" и \"Факт\"'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Бюджетирование, отчетность и анализ *' в течение 20 секунд

	* Открываем список операционных планов
		
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Операционные планы'
		Тогда открылось окно 'Операционные планы'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Операционный план: Планирование (создание) *'
		
	* Создаем план по БДДС с операцией Лимиты
		
		И из выпадающего списка "Вид операции" я выбираю точное значение 'Лимиты'
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
		И я нажимаю кнопку выбора у поля "Вариант настройки"
		Тогда открылось окно 'Варианты настроек операционного плана'
		И в таблице "Список" я перехожу к строке:
			| 'Вид бюджета'                      | 'Код'       | 'Наименование' |
			| 'Бюджет движения денежных средств' | '000000001' | 'Бюджет ДДС'   |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
		
	* Проверяем заполнение периода плана		

		Тогда элемент формы с именем "ПериодОтчета" стал равен '1 квартал 2025 г.'
		Тогда элемент формы с именем "ПериодОтчетаОкончание" стал равен '4 квартал 2025 г.'
		
	* Заполняем ЦФО
		
		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
	
	* Переходим на закладку Аналитики планирования

		И я перехожу к закладке "Данные планирования"

	* Вводим данные строки табличной части

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "СтатьяБюджета"
		Тогда открылось окно 'Статьи движения денежных средств'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| 'Оплата товаров' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
		И в таблице "КроссТаблица" я активизирую поле "Аналитика1"
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "Аналитика1"
		Тогда открылось окно 'Субконто Управления Холдингом'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' | 'Ссылка'  |
			| 'Кремний'      | 'Кремний' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" я активизирую поле 'Σ'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '500 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '500 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '500 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '500 000,00'
		И в таблице "КроссТаблица" я завершаю редактирование строки

	* Записываем и утверждаем документ

		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Провести и закрыть'
		Тогда открылось окно 'Операционные планы'
		И Я закрываю окно 'Операционные планы'

Сценарий 2.3. ОП (Планирование) при включенной константе 'Актулизировать показатели бюджетов и резервов'

	* Включаем константу 'Актулизировать показатели бюджетов и резервов'

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Бюджетирование, отчетность и анализ'
		Тогда открылось окно 'Бюджетирование, отчетность и анализ'
		И я устанавливаю флаг 'Автоматически актуализировать показатели бюджетирования по сценариям \"Резерв\" и \"Факт\"'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Бюджетирование, отчетность и анализ *' в течение 20 секунд
		
	* Создаем план БДДС с операцией Планирование

		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Операционные планы'
		Тогда открылось окно 'Операционные планы'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Операционный план: Планирование (создание) *'
		
	* Выбираем вид операции 

		И из выпадающего списка "Вид операции" я выбираю точное значение 'Планирование'	
		
	* Выбираем вариант настройки		

		И я нажимаю кнопку выбора у поля "Вариант настройки"
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' | 
			| 'Бюджет ДДС'   | 
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Планирование (создание) *'

	* Заполняем период

		И в поле с именем 'ПериодОтчета' я ввожу текст 'Май 2025 г.'
		И в поле с именем 'ПериодОтчетаОкончание' я ввожу текст 'Июль 2025 г.'		

	* Заполняем валюту плана

		И из выпадающего списка "Валюта документа" я выбираю точное значение 'RUB'
		И из выпадающего списка "Направление операции" я выбираю точное значение 'Расход'

	* Заполняем ЦФО
		
		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Планирование (создание) *'
	
	* Заполняем контрагента
	
		И я нажимаю кнопку выбора у поля с именем "Контрагент"
		Тогда открылось окно 'Выбор типа данных'
		И в таблице "" я перехожу к строке:
			| ''           |
			| 'Контрагент' |
		И в таблице "" я выбираю текущую строку
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Планирование (создание) *'	

	* Переходим к закладке Данные планирования

		И я перехожу к закладке "Данные планирования"

	* Вводим новую строку плана		

		И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "СтатьяБюджета"
		Тогда открылось окно 'Статьи движения денежных средств'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'   |
			| 'Оплата товаров' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Планирование (создание) *'
		И в таблице "КроссТаблица" я активизирую поле "Аналитика1"
		И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "Аналитика1"
		Тогда открылось окно 'Субконто Управления Холдингом'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' | 'Ссылка'  |
			| 'Кремний'      | 'Кремний' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" я активизирую поле 'Σ'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '100 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '100 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '100 000,00'
		И в таблице "КроссТаблица" я завершаю редактирование строки
	
	* Записываем и утверждаем документ

		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Провести и закрыть'
		Тогда открылось окно 'Операционные планы'
		И Я закрываю окно 'Операционные планы'

Сценарий 2.4. ОП (Резервирование) при включенной константе 'Актулизировать показатели бюджетов и резервов'

	* Включаем константу 'Актулизировать показатели бюджетов и резервов'

		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Бюджетирование, отчетность и анализ'
		Тогда открылось окно 'Бюджетирование, отчетность и анализ'
		И я устанавливаю флаг 'Автоматически актуализировать показатели бюджетирования по сценариям \"Резерв\" и \"Факт\"'
		И я нажимаю на кнопку 'Записать и закрыть'
		И я жду закрытия окна 'Бюджетирование, отчетность и анализ' в течение 20 секунд

	* Открываем список операционных планов
		
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Операционные планы'
		Тогда открылось окно 'Операционные планы'
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Операционный план: Планирование (создание) *'
		
	* Создаем план по БДДС с операцией Лимиты
		
		И из выпадающего списка "Вид операции" я выбираю точное значение 'Лимиты'
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
		И я нажимаю кнопку выбора у поля "Вариант настройки"
		Тогда открылось окно 'Варианты настроек операционного плана'
		И в таблице "Список" я перехожу к строке:
			| 'Вид бюджета'                      | 'Наименование' |
			| 'Бюджет движения денежных средств' | 'Бюджет ДДС'   |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
		
	* Проверяем заполнение периода плана		

		Тогда элемент формы с именем "ПериодОтчета" стал равен '1 квартал 2025 г.'
		Тогда элемент формы с именем "ПериодОтчетаОкончание" стал равен '4 квартал 2025 г.'
		
	* Заполняем ЦФО
		
		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Операционный план: Лимиты (создание) *'
	
	* Переходим на закладку Данные планирования

		И я перехожу к закладке "Данные планирования"

	* Вводим данные строки табличной части

		# И в таблице "КроссТаблица" я нажимаю на кнопку с именем 'КроссТаблицаДобавить'
		# И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "СтатьяБюджета"
		# Тогда открылось окно 'Статьи движения денежных средств'
		# И в таблице "Список" я перехожу к строке:
			# | 'Наименование'   | 'Код'       |
			# | 'Оплата товаров' | '00-000091' |
		# И в таблице "Список" я выбираю текущую строку
		# Тогда открылось окно 'Операционный план: Резервирование (создание) *'
		# И в таблице "КроссТаблица" я активизирую поле "Аналитика1"
		# И в таблице "КроссТаблица" я нажимаю кнопку выбора у реквизита "Аналитика1"
		# Тогда открылось окно 'Субконто Управления Холдингом'
		# И в таблице "Список" я перехожу к строке:
			# | 'Код'       | 'Наименование' | 'Ссылка'  |
			# | '000000006' | 'Кремний'      | 'Кремний' |
		# И в таблице "Список" я выбираю текущую строку
		
		И в таблице "КроссТаблица" я перехожу к первой строке
		И в таблице "КроссТаблица" я активизирую поле 'Σ'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '200 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '200 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '200 000,00'
		И в таблице "КроссТаблица" я перехожу к следующей ячейке
		И в таблице "КроссТаблица" в текущее поле я ввожу текст '200 000,00'
		И в таблице "КроссТаблица" я завершаю редактирование строки

	* Записываем и утверждаем документ

		И я нажимаю на кнопку 'Записать'
		И я нажимаю на кнопку 'Провести и закрыть'
		Тогда открылось окно 'Операционные планы'
		И Я закрываю окно 'Операционные планы'

