import news from "../lib/news"
import newsItem from "../lib/newsItem"

export default allNews = () ->
    return news([
        newsItem("Опрос про футболки", String.raw"""
            Я хочу сделать футболки алгопрога, для этого хочу понять, какое распределение размеров 
            и других пожеланий среди учеников алгопрога (как школьников, так и студентов-и-старше).
            Пожалуйста,
            <a href="https://docs.google.com/forms/d/e/1FAIpQLSeyuXvR_5qfDF8Cf5ydQycAIAgpfMdFdpwhYLtQj_D89FM7Rg/viewform?usp=sf_link">заполните опрос</a>.
        """),
        newsItem("Занятия по воскресеньям", String.raw"""
            Занятия по воскресеньям в этом учебном году будут проходить в <b>нижегородском филиале ВШЭ по адресу ул. Костина, д. 2б</b> (вход с пл. Горького, дверь справа от центра оперативной печати, проходите здание насквозь и во дворе вход в нужное здание), аудитория 203.<br/>
            Первые два занятия будет 12 и 19 сентября с 14:00 до 17:00. На него можно приходить только тем школьникам, 
            кто ходил на очные занятия раньше, или у кого уровень минимум 2.<br/>
            Первое занятие для новичков будет 26 сентября в 14:00, далее расписание занятий может слегка измениться.
        """),
        newsItem("Занятия в лицее 40", String.raw"""
            Первое занятие в лицее 40 в этом учебном году будет 8 сентября <b>в 15:00</b>. На него можно приходить только тем лицеистам, 
            кто ходил на очные занятия раньше, или у кого уровень минимум 2.<br/>
            Первое занятие для новичков будет 22 сентября <b>в 15:00</b>.
        """),
        newsItem("Опрос про алгопрог", String.raw"""
            Ответьте, пожалуйста, <a href="https://docs.google.com/forms/d/e/1FAIpQLSdDXTZ1yMHp_yk3Di5ie4BcI9HXKtnlJ8iyp9iupdX4fezqag/viewform?usp=sf_link">на несколько вопросов</a>. Тем, кто уже отвечал — я там добавил несколько вопросов, можете ответить еще раз.
        """),
    ])
