import news from "../lib/news"
import newsItem from "../lib/newsItem"

export default allNews = () ->
    return news([
        newsItem("Летние алгопрог-сборы", String.raw"""
            В конце августа возможно состоятся очередные алгопрог-сборы. <a href="https://docs.google.com/forms/d/e/1FAIpQLScFZsXN4hMypHOgS8XZbb84xl1ye_Wq4IEDtx1ilt_H8gh5NQ/viewform">Подробная информация и форма для подачи заявок</a>
        """),
        
        newsItem("Деактивация аккаунтов", String.raw"""
            В связи с переходом на новый учебный год я деактивировал почти все аккаунты. Если вы планируете продолжать заниматься,
            напишите мне, я активирую обратно. Укажите также, в каком классе и какой школы вы будете учиться в следующем учебном году.
        """),

        newsItem("Окончание очных занятий в этом году", String.raw"""
            Последние очные занятия в этом учебном году состоятся 25 мая в лицее 40 и 29 мая во ВШЭ. Летом очных занятий не будет. 
            В следующем учебном году занятия начнутся ориентировочно в середине сентября, следите за объявлениями на сайте.
        """),

        newsItem("Опрос про алгопрог", String.raw"""
            Ответьте, пожалуйста, <a href="https://docs.google.com/forms/d/e/1FAIpQLSdDXTZ1yMHp_yk3Di5ie4BcI9HXKtnlJ8iyp9iupdX4fezqag/viewform?usp=sf_link">на несколько вопросов</a>. Тем, кто уже отвечал — я там добавил несколько вопросов, можете ответить еще раз.
        """),
    ])
