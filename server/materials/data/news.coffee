import news from "../lib/news"
import newsItem from "../lib/newsItem"

export default allNews = () ->
    return news([
        newsItem("Занятия в майские праздники", String.raw"""
            1, 8 и 15 мая занятий во ВШЭ не будет. 22 мая занятие будет.<br/>
            4 и 11 мая занятий в лицее 40 не будет. 27 апреля занятие будет, 18 мая тоже, скорее всего, будет.
        """),

        newsItem("Опрос про алгопрог", String.raw"""
            Ответьте, пожалуйста, <a href="https://docs.google.com/forms/d/e/1FAIpQLSdDXTZ1yMHp_yk3Di5ie4BcI9HXKtnlJ8iyp9iupdX4fezqag/viewform?usp=sf_link">на несколько вопросов</a>. Тем, кто уже отвечал — я там добавил несколько вопросов, можете ответить еще раз.
        """),
    ])
