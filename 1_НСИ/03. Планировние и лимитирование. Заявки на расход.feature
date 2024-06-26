﻿#language: ru
@tree

@ERPUH31_NSI

Функционал: 3. Планировние и лимитирование. Заявки на расход

	Как бизнес-аналитик я хочу
	проверить работоспособность документов опеативного планирования
	чтобы исключить ошибки установки лимитов, резервирования и планирования

Контекст:

	И я подключаю TestClient "ЕРПУХ 3.1 ТЕСТ" логин "Администратор" пароль ""
	И Я закрыл все окна клиентского приложения

Сценарий: 3.1. Заявка на расход. Расчеты с контрагентами 

	* Открываем раздел планирования, хаявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'             |
			| 'Расчеты с контрагентами'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Контрагент
	
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Договор
	
		И я нажимаю кнопку выбора у поля "Договор"
		Тогда открылось окно 'Договоры с контрагентами'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта взаиморасчетов' | 'Вид договора'  | 'Действует по' | 'Действует с' | 'Номер'   | 'Рабочее наименование'  | 'Статус'    |
			| 'RUB'                   | 'С покупателем' | '05.10.2022'   | '05.10.2020'  | 'ПОК_001' | 'ПОК_001 от 05.10.2020' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'             |
			| 'Контрагенты'     | 'Расход'       | 'Административные расходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расчеты с контрагентами' в течение 20 секунд
	
Сценарий: 3.2. Заявка на расход. Расчеты с подотчетными лицами 

	* Открываем раздел планирования, хаявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                   |
			| 'Расчеты с подотчетными лицами'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Сотрудник
	
		И я нажимаю кнопку выбора у поля "Сотрудник"
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Гадже Гхале'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'            |
			| 'Финансовая деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Доход/Расход' | 'Наименование'         |
			| 'Расход'       | 'Комиссии по кредитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расчеты с подотчетными лицами' в течение 20 секунд

Сценарий: 3.3. Заявка на расход. Прочие расходы 

	* Открываем раздел планирования, хаявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'    |
			| 'Прочие расходы'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'            |
			| 'Финансовая деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Доход/Расход' | 'Наименование'         |
			| 'Расход'       | 'Комиссии по кредитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Прочие расходы' в течение 20 секунд

Сценарий: 3.4. Заявка на расход. Расходы по заработной плате 

	* Открываем раздел планирования, хаявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                 |
			| 'Расходы по заработной плате'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Сотрудник
	
		И я нажимаю кнопку выбора у поля "Сотрудник"
		Тогда открылось окно 'Физические лица'
		И в таблице "Список" я перехожу к строке:
			| 'ФИО'          |
			| 'Гадже Гхале'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'            |
			| 'Финансовая деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Доход/Расход' | 'Наименование'         |
			| 'Расход'       | 'Комиссии по кредитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расходы по заработной плате' в течение 20 секунд

Сценарий: 3.5. Заявка на расход. Расходы по ценным бумагам 

	* Открываем раздел планирования, хаявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'               |
			| 'Расходы по ценным бумагам'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Ценная бумага
	
		И я нажимаю кнопку выбора у поля "Ценная бумага"
		Тогда открылось окно 'Ценные бумаги'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                  |
			| 'Переводной вексель 20.01.2018' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'            |
			| 'Финансовая деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Доход/Расход' | 'Наименование'         |
			| 'Расход'       | 'Комиссии по кредитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расходы по ценным бумагам' в течение 20 секунд
		
Сценарий: 3.6. Заявка на расход. Расходы по налогам и сборам 

	* Открываем раздел планирования, заявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                 |
			| 'Расходы по налогам и сборам'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'            |
			| 'Финансовая деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Доход/Расход' | 'Наименование'         |
			| 'Расход'       | 'Комиссии по кредитам' |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расходы по налогам и сборам' в течение 20 секунд	

Сценарий: 3.7. Заявка на расход. Расходы по кредитам и займам (контрагенты)

	* Открываем раздел планирования, заявку на расход
	
		И В командном интерфейсе я выбираю 'Планирование и контроль' 'Заявки на расход'
		Тогда открылось окно 'Заявки на расход'
		
	* Создаем документ	
	
		И Я запоминаю значение выражения 'СокрЛП(ТекущаяДата())' в переменную "ТекущаяДата"
		И в таблице "Список" я нажимаю на кнопку с именем 'Создать'
		Тогда открылось окно 'Заявка на расход (создание)'
		И я нажимаю кнопку выбора у поля "Вид операции"
		Тогда открылось окно 'Виды операций'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'                                |
			| 'Расходы по кредитам и займам (контрагенты)'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Организация	
			
		И из выпадающего списка "Организация" я выбираю точное значение 'Юпитер'
		И я нажимаю кнопку выбора у поля "Организация"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование' |
			| 'Юпитер'               |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
	
	* Контрагент
	
		И я нажимаю кнопку выбора у поля "Контрагент"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Сумма, дата, валюта
	
		И в поле 'Не позднее' я ввожу значение переменной "ТекущаяДата"
		И я перехожу к следующему реквизиту
		И в поле 'Сумма' я ввожу текст '150,00'
		И я перехожу к следующему реквизиту
		И из выпадающего списка "ВалютаДокумента" я выбираю точное значение 'RUB'

	* Договор
	
		И я нажимаю кнопку выбора у поля "Договор"
		Тогда открылось окно 'Договоры с контрагентами'
		И в таблице "Список" я перехожу к строке:
			| 'Валюта взаиморасчетов' | 'Вид договора'  | 'Действует по' | 'Действует с' | 'Номер'   | 'Рабочее наименование'  | 'Статус'    |
			| 'RUB'                   | 'С покупателем' | '05.10.2022'   | '05.10.2020'  | 'ПОК_001' | 'ПОК_001 от 05.10.2020' | 'Действует' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Закладка Аналитики
	
		И я перехожу к закладке "Аналитики учета и планирования"
		
	* ЦФО

		И я нажимаю кнопку выбора у поля "ЦФО"
		Тогда открылось окно 'Организации'
		И в таблице "Список" я перехожу к строке:
			| 'Рабочее наименование'  |
			| 'ЦФО Солнечная система' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		
	* Статья бюджета
	
		И в таблице "ТаблицаДвижений" я перехожу к первой строке
		И в таблице "ТаблицаДвижений" я перехожу к следующей ячейке
		И в таблице "ТаблицаДвижений" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Статья БДР / Аналитики статьи"
		Тогда открылось окно 'Статьи доходов и расходов'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование'              |
			| 'Операционная деятельность' |
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Вид аналитики 1' | 'Доход/Расход' | 'Наименование'             |
			| 'Контрагенты'     | 'Расход'       | 'Административные расходы' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заявка на расход (создание) *'
		И в таблице "ТаблицаДвижений" я нажимаю кнопку выбора у реквизита "Аналитика 1"
		Тогда открылось окно 'Контрагенты (юридические или физические лица)'
		И в таблице "Список" я перехожу к строке:
			| 'Наименование' |
			| 'ООО "Весна"'  |
		И в таблице "Список" я выбираю текущую строку
		И в таблице "ТаблицаДвижений" я завершаю редактирование строки

	* Статус
	
		И я нажимаю на кнопку 'Записать'
		И из выпадающего списка "Статус" я выбираю точное значение 'Утвержден'
		
	* Проведение и закрытие
	
		И я нажимаю на кнопку 'Провести и закрыть'
		И я жду закрытия окна 'Заявка на расход * ООО "Весна"; Расходы по кредитам и займам (контрагенты)' в течение 20 секунд	
