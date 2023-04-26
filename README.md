# Проект “Умный дом”.

**Давайте рассмотрим следующие типы датчиков для конкретной квартиры дома:**

- Датчик для управления жалюзи шторами в квартире
- Датчик движения в квартире
- Датчик протечки воды в квартире
- Датчик открытия двери / окна в квартире
- Датчик дыма в квартире
*Указанные датчики формируют экосистему квартиры, которая может состоять из множества датчиков разного типа.*

**Каждый датчик характеризуется:**

- Уникальным номером (идентификатором) внутри экосистем всех квартир, характеризующийся набором цифр и буквенных символов (например ‘дат№1_№123’)
- Типом датчика - строковое значение с указанием Типа датчика, которые перечислены ниже (например ‘Датчик движения’)
- Является ли он включенным / выключенным в экосистеме квартиры (значение Истина / Ложь)
- Датой ввода в эксплуатацию (с указанием дня / месяца / года)
- Номером квартиры, где он установлен - строковое значение (например ‘3405’)

Каждый датчик посылает сигнал о своем состоянии **каждые 10 секунд** в базу данных. Возможны следующие значения состояний по датчикам:

Датчик движения отсылает два состояния (0 - движение не обнаружено, 1 - движение обнаружено)
Датчик протечки воды отсылает два состояния (0 - протечка не обнаружена, 1- протечка обнаружена)
Датчик открытия двери отсылает два состояния (0 - дверь / окно не открыто, 1- дверь / окно открыто)
Датчик открытия окна отсылает два состояния (0 - дверь / окно не открыто, 1- дверь / окно открыто)
Датчик для управления жалюзи отсылает два состояния (0 - жалюзи / шторы закрыты, 1- жалюзи / шторы открыты)
Датчик для управления шторами отсылает два состояния (0 - жалюзи / шторы закрыты, 1- жалюзи / шторы открыты)
Датчик дыма отсылает два состояния (0 - задымление не обнаружено, 1 - задымление обнаружено)

# Задача
- Создать физическую модель данных для описания зарегистрированных датчиков внутри экосистем всех квартир на основании типа датчика.
- Создать физическую модель данных оперативной таблицы для хранения значений показателей всех датчиков со всех квартир дома по указанной дате ( с учетом дня / месяца / года / часов / минут / секунд). Обратите внимание что здесь можно использовать паттерн EAV (Entity-Attribute-Value) модели данных.
- Зарегистрировать 5 датчиков разного типа в вашу модель данных для квартиры № ‘123-А’ с датой ввода в эксплуатацию 25 сентября 2022 года.
- Создать 20 показаний по разным типам датчиков для квартиры № ‘123-А’ для оперативных данных (с интервалом времени в 10 секунд для конкретного типа датчика) и с произвольным значением состояния датчика 0 или 1.
- Написать SQL запрос для получения списка значений отосланных состояний за указанный промежуток по любому датчику, отсортированных по дате (времени) получения в обратном порядке.