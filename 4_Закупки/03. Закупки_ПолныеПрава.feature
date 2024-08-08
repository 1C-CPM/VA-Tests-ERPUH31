﻿#language: ru
@tree

@ERPUH31_Purchases

Функционал: 03. Под профилем "Администратор". Настройки (Сквозное планирование потребности = Нет)

	Как бизнес-аналитик я хочу
	проверить создание документов подситемы и закрытие регистров
	чтобы исключить ошибки

Контекст:

	И я подключаю TestClient "ЕРПУХ31 - Закупки" логин "Администратор" пароль ""
	И я закрыл все окна клиентского приложения

		Если открылось окно "Предупреждение безопасности" Тогда
			И я нажимаю на кнопку с именем 'НеЗапрещать'
			И Я закрываю окно ""
		
//Сценарий: 03.01. Виды цен / - не использую

//	* Открываем справочник
//		
//		Дано Я открываю основную форму списка справочника "ВидыЦен"
//		Тогда открылось окно 'Виды цен '
//	
//	* Создаем новый вид цен
//
//		И я нажимаю на кнопку с именем 'ФормаСоздать'
//		Тогда открылось окно 'Вид цены (создание)'
//	
//	* Заполняем реквизиты
//
//		И в поле с именем 'Наименование' я ввожу текст 'Прайс-лист'
//		И я перехожу к следующему реквизиту
//		И из выпадающего списка с именем "СтатусДействия" я выбираю точное значение 'Действует'
//		И из выпадающего списка с именем "Назначение" я выбираю точное значение 'всех'
//		И из выпадающего списка с именем "ВалютаЦены" я выбираю точное значение 'RUB'
//		И я устанавливаю флаг с именем 'ЦенаВключаетНДС'
//		И из выпадающего списка с именем "СпособЗаданияЦены" я выбираю точное значение 'Ручное назначение'
//
//	* Записываем и закрываем
//
//		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'		И Я закрываю окно 'Виды цен '

Сценарий: 03.01. Корпоративные закупки (настройки)

	* Открываем настройки
	
		И В командном интерфейсе я выбираю 'Общие справочники и настройки' 'Корпоративные закупки'
		Тогда открылось окно 'Корпоративные закупки'
	
	* Периодичность	

		И из выпадающего списка с именем 'ПериодичностьЦентрализованныхЗакупок' я выбираю точное значение "Месяц"

	* Не требовать регистрации участников для открытых способах закупок

		И я устанавливаю флаг с именем 'НеТребоватьРегистрацииУчастниковДляОткрытыхСпособовЗакупок'
	
	* Тип цен для расценки потребности
	
		И я нажимаю кнопку выбора у поля с именем "ТипЦенДляРасценкиЗаявокНаПотребность"
		Тогда открылось окно 'Виды цен '
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'|
			| 'Прайс-лист'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Корпоративные закупки'

//	* Способ расчета даты поставки
//	
//		И я нажимаю кнопку выбора у поля с именем "СпособРасчетаДатыОперацииПериода"
//		И из выпадающего списка с именем "СпособРасчетаДатыОперацииПериода" я выбираю точное значение 'Конец периода'
		
//	* Правило заполнения статьи бюджета
//
//		И я нажимаю кнопку выбора у поля с именем "ПравилоЗаполненияСтатьиБюджета"
//		И из выпадающего списка с именем "ПравилоЗаполненияСтатьиБюджета" я выбираю точное значение 'По категории закупок'
//		
//		И я нажимаю на кнопку с именем 'ФормаНастроитьСтатьи'
//		Тогда открылось окно 'Настройки статей'
//		И в таблице "СтатьиТК" я активизирую поле с именем "ПланыДокументаСтатьяБюджета"
//		И в таблице "СтатьиТК" я выбираю текущую строку
//		И в таблице "СтатьиТК" я нажимаю кнопку выбора у реквизита с именем "ПланыДокументаСтатьяБюджета"
//		Тогда открылось окно 'Статьи движения денежных средств'
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'              |
//			| 'Операционная деятельность' |
//		И в таблице  "Список" я перехожу на один уровень вниз
//		И в таблице "Список" я перехожу к строке:
//			| 'Наименование'                               |
//			| 'Оплата поставщику (товары, работы, услуги)' |
//		И в таблице "Список" я выбираю текущую строку
//		Тогда открылось окно 'Настройки статей'
//		И в таблице "СтатьиТК" я завершаю редактирование строки
//		И я нажимаю на кнопку с именем 'ФормаЗакрыть'
//		Тогда открылось окно 'Корпоративные закупки'
		
	* Сценарий товарного планирования
	
		Дано Я открываю основную форму списка справочника "СценарииТоварногоПланирования"
		Когда открылось окно "Сценарии товарного планирования"
		
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно "Сценарий товарного планирования (создание)"
		И в поле с именем 'Наименование' я ввожу текст "Корпоративный план"
		И я перехожу к следующему реквизиту
		И из выпадающего списка с именем 'Периодичность' я выбираю точное значение "Месяц"
		И я меняю значение переключателя с именем 'ПланЗакупокПланировать' на "По количеству и сумме"
		И из выпадающего списка с именем 'Валюта' я выбираю точное значение "RUB"
		И я перехожу к закладке с именем 'СтраницаСтруктураПланов'
		И из выпадающего списка с именем 'РежимФормированияПотребностейПланомЗакупок' я выбираю точное значение "Регистрируют потребности"
		И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Тогда открылось окно "Корпоративный план (Сценарий товарного планирования)"
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна "Корпоративный план (Сценарий товарного планирования)" в течение 20 секунд
		Тогда открылось окно "Сценарии товарного планирования"
		
		И Я закрываю окно "Сценарии товарного планирования"
	
	* Вид плана
	
		Дано Я открываю основную форму справочника "ВидыПланов"
		Тогда открылось окно 'Вид плана (создание)'
		
		И я нажимаю кнопку выбора у поля с именем "Владелец"
		Тогда открылось окно 'Сценарии товарного планирования'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'       | 'Периодичность' | 'Валюта' |
			| 'Корпоративный план' | 'Месяц'         | 'RUB'    |
		И в таблице "Список" я выбираю текущую строку
		И из выпадающего списка с именем "ТипПлана" я выбираю точное значение 'Плана закупок'
		И в поле с именем 'Наименование' я ввожу текст 'Основной'
		И я меняю значение переключателя 'Замещающий' на 'Суммирующий'
		И я перехожу к закладке с именем "Настройки"
		И я меняю значение переключателя с именем 'ЗаполнятьПоФормуле' на 'Заполнять по источникам'
		И в поле с именем 'КоличествоПериодов' я ввожу текст '12'
		И я перехожу к закладке "Детализация"
		И я устанавливаю флаг с именем 'ЗаполнятьСклад'
		Когда открылось окно 'Вид плана (создание) *'
		И я устанавливаю флаг с именем 'ЗаполнятьСкладВТЧ'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		Тогда открылось окно 'Корпоративные закупки'	
	
	* Разделять номенклатуру по ТК
		
		И я снимаю флаг с именем 'ИспользоватьКатегорийнуюМатрицуДляДоступаКПотребностям'
		Если открылось окно '1С:Предприятие' Тогда
			И я нажимаю на кнопку с именем 'Button1'

	* Вести учет номенклатуры по странам
		
		И я снимаю флаг с именем 'ВестиУчетПоСтранамКорпоративныеЗакупки'
		
	* Регистрировать номенклатуру поставщика
	
		И я снимаю флаг с именем 'УчетНоменклатурыПоставщика'

	* Закрываем настройки
	
		И Я закрываю окно 'Корпоративные закупки'

Сценарий: 03.02. Приказ о назначении закупочной комиссии

		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Приказ о назначении закупочной комиссии'
		Тогда открылось окно 'Приказ о назначении закупочной комиссии'
		
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Приказ о назначении закупочной комиссии (создание)'
		
		И в таблице "ЗакупочнаяКомиссия" я нажимаю на кнопку с именем 'ЗакупочнаяКомиссияДобавить'
		
		И в таблице "ЗакупочнаяКомиссия" я нажимаю кнопку выбора у реквизита с именем "ЗакупочнаяКомиссияОрганизация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Королевство Севера [223]' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Приказ о назначении закупочной комиссии (создание) *'
		
		И в таблице "ЗакупочнаяКомиссия" я активизирую поле с именем "ЗакупочнаяКомиссияДолжность"
		И в таблице "ЗакупочнаяКомиссия" я нажимаю кнопку выбора у реквизита с именем "ЗакупочнаяКомиссияДолжность"
		Тогда открылось окно 'Должности'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'Инженер'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Приказ о назначении закупочной комиссии (создание) *'
		
		И я перехожу к следующему реквизиту
		И в таблице "ЗакупочнаяКомиссия" я нажимаю кнопку выбора у реквизита с именем "ЗакупочнаяКомиссияРоль"
		И в таблице "ЗакупочнаяКомиссия" из выпадающего списка с именем "ЗакупочнаяКомиссияРоль" я выбираю точное значение 'Председатель комиссии'

		И я перехожу к следующему реквизиту
		И в таблице "ЗакупочнаяКомиссия" я нажимаю кнопку выбора у реквизита с именем "ЗакупочнаяКомиссияСотрудник"
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'            |
			| 'Мормонт Джорах' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Приказ о назначении закупочной комиссии (создание) *'
		
		И в таблице "ЗакупочнаяКомиссия" я завершаю редактирование строки

		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Приказ о назначении закупочной комиссии (создание) *' в течение 20 секунд
		Тогда открылось окно 'Приказ о назначении закупочной комиссии'
		И Я закрываю окно 'Приказ о назначении закупочной комиссии'

Сценарий: 03.03. Источники финансирования
	
	* Создание источника
	
		И В командном интерфейсе я выбираю 'Корпоративные закупки' 'Источники финансирования'
		Тогда открылось окно 'Источники финансирования'
		
	* Собственное 
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Источник финансирования (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Собственное финансирование'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Источник финансирования (создание) *' в течение 20 секунд
		Тогда открылось окно 'Источники финансирования'

	* Внешнее 
	
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Источник финансирования (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'Внешнее финансирование'
		И я перехожу к следующему реквизиту
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Источник финансирования (создание) *' в течение 20 секунд
		Тогда открылось окно 'Источники финансирования'
	
	* Закрываем	
	
		И Я закрываю окно 'Источники финансирования'

Сценарий: 03.04. Установка цен номенклатуры

	* Запоминаем параметры

		И Я запоминаю значение выражения 'СокрЛП(НачалоГода(ТекущаяДата()))' в переменную "НачалоГода"

	* Открываем список документов установки цен

		Дано Я открываю основную форму документа "УстановкаЦенНоменклатуры"
		Тогда открылось окно 'Установка цен номенклатуры (создание)'
	
	* Дата документа
	
		И в поле с именем 'Дата' я ввожу значение переменной "НачалоГода"
		И я перехожу к следующему реквизиту

	* Выбираем вид цены

		И в таблице "ВыбранныеЦены" я перехожу к строке:
			| 'Валюта' | 'Виды цен'   | 
			| 'RUB'    | 'Прайс-лист' | 
		И в таблице "ВыбранныеЦены" я активизирую поле с именем "ВыбранныеЦеныРедактировать"
		И в таблице "ВыбранныеЦены" я устанавливаю флаг с именем 'ВыбранныеЦеныРедактировать'
		И в таблице "ВыбранныеЦены" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'ВидыЦенКомандаДалее'
		
	* Работа1
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Работа'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Работа1'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "8 500 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Работа2
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Работа'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Работа2'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "426 800,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Работа3
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Работа'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Работа3'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "18 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Материал1
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Материал1'    |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "1 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Материал2
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Материал2'    |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "1 300,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки
		
	* Материал3
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Материал3'    |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "1 500,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки
		
	* Товар1
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар1'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "10 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки
		
	* Товар2
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар2'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "8 500,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки
		
	* Товар3
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар3'    |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "5 333,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки	
	
	* Товар4
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар4'    |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "12 254,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Товар5
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар5'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "25 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки
		
	* Товар6
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Товар'        |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Товар6'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "101 980,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Услуга1
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга1'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "300 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки

	* Услуга2
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга2'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "24 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки	
		
	* Услуга3
	
		И в таблице "ДеревоЦен" я нажимаю на кнопку с именем 'ДеревоЦенДобавитьНоменклатуру'
		И в таблице "ДеревоЦен" я нажимаю кнопку выбора у реквизита с именем "ДеревоЦенНоменклатура"
		Тогда открылось окно 'Номенклатура'
		И в таблице "ВидыНоменклатуры" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга'       |
		И в таблице "СписокРасширенныйПоискНоменклатура" я перехожу к строке:
			| 'Наименование' |
			| 'Услуга3'      |
		И в таблице "СписокРасширенныйПоискНоменклатура" я выбираю текущую строку
		Тогда открылось окно 'Установка цен номенклатуры (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице 'ДеревоЦен' я активизирую поле 'Цена'
		И в таблице "ДеревоЦен" в текущее поле я ввожу текст "46 000,00"
		И в таблице "ДеревоЦен" я завершаю редактирование строки		
		
	* Записываем и закрываем документ
	
		Когда открылось окно 'Установка цен номенклатуры (создание) *'
		И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
		И я жду закрытия окна 'Установка цен номенклатуры (создание) *' в течение 20 секунд
		
Сценарий: 03.05. Расширяем профиль группы доступа для МенеджерПоЗакупкам1

	* Создаем группу доступа "Оценка и выбор альтернатив"
	
		И В командном интерфейсе я выбираю 'НСИ и администрирование' 'Настройки пользователей и прав'
		Тогда открылось окно 'Настройки пользователей и прав'
		
		И я нажимаю на кнопку с именем 'ОткрытьПрофилиГруппДоступа'
		Тогда открылось окно 'Профили групп доступа'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'               |
			| 'Оценка и выбор альтернатив' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Оценка и выбор альтернатив (Профиль групп доступа)'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Группы доступа'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Группа доступа (создание) *'
		И в поле с именем 'Наименование' я ввожу текст 'Оценка и выбор альтернатив'
		И я перехожу к следующему реквизиту
		И в таблице "Пользователи" я нажимаю на кнопку с именем 'ПользователиПодобрать'
		Тогда открылось окно 'Подбор участников группы доступа'
		И в таблице "ПользователиСписок" я перехожу к строке:
			| 'Полное имя'          |
			| 'МенеджерПоЗакупкам1' |
		И в таблице "ПользователиСписок" я выбираю текущую строку

		И я нажимаю на кнопку с именем 'ЗавершитьИЗакрытьВыбор'
		Тогда открылось окно 'Группа доступа (создание) *'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Группа доступа (создание) *' в течение 20 секунд
		Тогда открылось окно 'Оценка и выбор альтернатив (Профиль групп доступа)'
		И Я закрываю окно 'Оценка и выбор альтернатив (Профиль групп доступа)'
		Тогда открылось окно 'Профили групп доступа'
		
	* Создаем группу доступа "Бюджетирование и казначейство"
	
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                  |
			| 'Бюджетирование и казначейство' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Бюджетирование и казначейство (Профиль групп доступа)'
		И В текущем окне я нажимаю кнопку командного интерфейса 'Группы доступа'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Группа доступа (создание) *'
		И в поле с именем 'Наименование' я ввожу текст 'Бюджетирование и казначейство'
		И я перехожу к следующему реквизиту
		И в таблице "Пользователи" я нажимаю на кнопку с именем 'ПользователиПодобрать'
		Тогда открылось окно 'Подбор участников группы доступа'
		И в таблице "ПользователиСписок" я перехожу к строке:
			| 'Полное имя'          |
			| 'МенеджерПоЗакупкам1' |
		И в таблице "ПользователиСписок" я выбираю текущую строку

		И я нажимаю на кнопку с именем 'ЗавершитьИЗакрытьВыбор'
		Тогда открылось окно 'Группа доступа (создание) *'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'Группа доступа (создание) *' в течение 20 секунд
		Тогда открылось окно 'Бюджетирование и казначейство (Профиль групп доступа)'
		И Я закрываю окно 'Бюджетирование и казначейство (Профиль групп доступа)'

	* Закрываем профили групп доступа

		И я закрываю все окна клиентского приложения

Сценарий: 03.06. Подключаем протокол к согласованию

		И В командном интерфейсе я выбираю "Общие справочники и настройки" "Документы"
		Тогда открылось окно "Документы текущей информационной базы"

		И в таблице 'Список' я перехожу к строке:
			| "Документ внешней ИБ"       |
			| "ПротоколВыбораПобедителей" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ)"

		И я перехожу к закладке с именем 'ГруппаСогласование'

		И я нажимаю кнопку выбора у поля с именем 'РеквизитСостояния'
		Тогда открылось окно "Перечисления ИБ"
		И в таблице 'Список' я перехожу к строке:
			| "Наименование"          |
			| "СостоянияСогласования" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ) *"

		И я нажимаю кнопку выбора у поля с именем 'ЗначениеРеквизитаСостоянияЧерновик'
		Тогда открылось окно "Состояния согласования"
		И в таблице 'Список' я перехожу к строке:
			| "Ссылка"   |
			| "Черновик" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ) *"

		И я нажимаю кнопку выбора у поля с именем 'ЗначениеРеквизитаСостоянияНаУтверждении'
		Тогда открылось окно "Состояния согласования"
		И в таблице 'Список' я перехожу к строке:
			| "Ссылка"         |
			| "На утверждении" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ) *"

		И я нажимаю кнопку выбора у поля с именем 'ЗначениеРеквизитаСостоянияУтвержден'
		Тогда открылось окно "Состояния согласования"
		И в таблице 'Список' я перехожу к строке:
			| "Ссылка"    |
			| "Утвержден" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ) *"

		И я нажимаю кнопку выбора у поля с именем 'ЗначениеРеквизитаСостоянияОтклонен'
		Тогда открылось окно "Состояния согласования"
		И в таблице 'Список' я перехожу к строке:
			| "Ссылка"   |
			| "Отклонен" |
		И в таблице 'Список' я выбираю текущую строку
		Тогда открылось окно "Протокол выбора победителей (Документ ИБ) *"

		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'
		
		Если открылось окно "1С:Предприятие" Тогда
			И я нажимаю на кнопку с именем 'Button0'

		Тогда открылось окно "Документы текущей информационной базы"
		И Я закрываю окно "Документы текущей информационной базы"

	* Закрываем клиент тестирования
	
		И я закрываю TestClient "ЕРПУХ31 - НСИ"