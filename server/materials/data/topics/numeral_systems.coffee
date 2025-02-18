import contest from "../../lib/contest"
import label from "../../lib/label"
import link from "../../lib/link"
import page from "../../lib/page"
import problem from "../../lib/problem"
import topic from "../../lib/topic"
import {ruen} from "../../lib/util"

export default numeral_systems = () ->
    return {
        topic: topic(
            ruen("Системы счисления. Двоичная система счисления.", "Numeral systems. Binary system."),
            ruen("Задачи на системы счисления", "Problems on numeral systems"),
        [label(ruen(
             "Теории тут пока нет, можете поискать в интернете (я нашел <a href=\"https://ru.wikibooks.org/wiki/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B_%D1%81%D1%87%D0%B8%D1%81%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F\">раз</a>, <a href=\"https://habrahabr.ru/post/124395/\">два</a>). Вам нужно понимание того, как работают позиционные системы счисления, и как переводить числа из одной системы в другую.",
             "There is no theory here yet, you can search on the Internet (I found <a href=\"https://ru.wikibooks.org/wiki/%D0%A1%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D1%8B_%D1%81%D1%87%D0%B8%D1%81%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F\">one</a>, <a href=\"https://habrahabr.ru/post/124395/\">two</a>). You need an understanding of how positional numeral systems works, and how to translate numbers from one system to another.")),
            problem(117),
            problem(344),
            problem(47),
            problem(1367),
            problem(46),
        ], "numeral_systems"),
        advancedProblems: [
            problem(245),
            problem(111584)
        ]
    }