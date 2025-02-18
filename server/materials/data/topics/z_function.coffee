import contest from "../../lib/contest"
import label from "../../lib/label"
import link from "../../lib/link"
import page from "../../lib/page"
import problem from "../../lib/problem"
import topic from "../../lib/topic"
import {ruen} from "../../lib/util"

export default z_function = () ->
    return {
        topic: topic(
            ruen("Z-функция", "Z-function"),
            ruen("Задачи на Z-функцию", "Problems on Z-function"),
        [label(ruen(
             "<p>См. <a href=\"https://sis.khashaev.ru/2008/august/b-prime/\">видеозаписи лекций ЛКШ.2008.B'</a>, раздел \"Алгоритмы на строках\".<br>\n<a href=\"https://e-maxx.ru/algo/z_function\">Теория на e-maxx</a><br>\n<a href=\"https://ru.wikipedia.org/wiki/Z-функция\">Теория в википедии (!)</a><br>\n<a href=\"https://neerc.ifmo.ru/wiki/index.php?title=Z-функция\">Теория на сайте ИТМО</a><br>\n<a href=\"https://habrahabr.ru/post/113266/\">Теория на хабре</a></p>",
             "<p>See the video <a href=\"https://sis.khashaev.ru/2008/august/b-prime/\">recordings of lectures SIS.2008.B'</a>, section \"Algorithms on strings\".<br>\n<a href=\"https://e-maxx.ru/algo/z_function\">Theory on e-maxx</a><br>\n<a href=\"https://ru.wikipedia.org/wiki/Z-\u0444\u0443\u043d\u043a\u0446\u0438\u044f\">Theory in wikipedia (!)</a><br>\n<a href=\"https://neerc.ifmo.ru/wiki/index.php?title=Z-\u0444\u0443\u043d\u043a\u0446\u0438\u044f\">Theory on the ITMO website</a><br>\n<a href=\"https://habrahabr.ru/post/113266/\">Theory on habr</a></p>")),
            problem(1324),
            problem(1326),
            problem(3369),
        ], "z_function"),
        advancedProblems: [
            problem(998),
        ]
    }