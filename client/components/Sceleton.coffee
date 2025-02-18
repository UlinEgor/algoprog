React = require('react')
FontAwesome = require('react-fontawesome')
moment = require('moment')

import Row from 'react-bootstrap/lib/Row'
import Col from 'react-bootstrap/lib/Col'
import Grid from 'react-bootstrap/lib/Grid'
import Breadcrumb from 'react-bootstrap/lib/Breadcrumb'
import Navbar from 'react-bootstrap/lib/Navbar'
import { LinkContainer } from 'react-router-bootstrap'
import { Link } from 'react-router-dom'

import { Helmet } from "react-helmet"

import Lang, {LangRaw} from '../lang/lang'

import ConnectedComponent from '../lib/ConnectedComponent'
import withLang from '../lib/withLang'
import withTheme from '../lib/withTheme'

import Tree from './Tree'
import News from './News'
import BlogPosts from './BlogPosts'
import CommentList from './CommentList'
import TopPanel from './TopPanel'

import isPaid from '../lib/isPaid'
import GROUPS from '../lib/groups'

import styles from './Sceleton.css'

SIZES = ["xs", "sm", "md", "lg"]
DEFAULT_PATH = [{_id: "main", title: "/"}]

Bread = (props) ->
    <Breadcrumb>
        {
        props.path.map((p) ->
            href = if p._id != "main" then "/material/" + p._id else "/"
            title = if p._id != "main" then p.title else "/"
            <LinkContainer to={href} key={p._id} isActive={() -> false}>
                 <Breadcrumb.Item active={p._id==props.id}>
                    {title}
                </Breadcrumb.Item>
            </LinkContainer>
        )
        }
    </Breadcrumb>

ColWrapper = (props) ->
    subProps = {}
    for size in SIZES
        if props.size[size] == 0
            subProps[size + "Hidden"] = true
        else
            subProps[size] = props.size[size]
    `<Col {...subProps}>{props.children}</Col>`

class PaidTill extends React.Component
    render: () ->
        href = "/pay"
        if GROUPS[@props.myUser?.userList]?.paid
            href = "/payment"
            if @props.myUser?.paidTill && isPaid(@props.myUser)
                preLink = "#{LangRaw('paid_till', @props.lang)} #{moment(@props.myUser.paidTill).format('DD.MM.YYYY')} "
                inLink = LangRaw('extend_payment', @props.lang)
            else if @props.myUser?.paidTill
                preLink = "#{LangRaw('was_paid_till', @props.lang)} #{moment(@props.myUser.paidTill).format('DD.MM.YYYY')} "
                inLink = LangRaw('extend_payment', @props.lang)
            else
                preLink = ""
                inLink = LangRaw('pay', @props.lang)
        else
            preLink = ""
            inLink = ""
        <span>
            {preLink}
            {inLink != "" && <Link to={href}>
                {inLink}
                {" "}
                <FontAwesome name="cc-visa"/>
                {" "}
                <FontAwesome name="cc-mastercard"/>
            </Link>}
        </span>


paidTillOptions =
    urls: (props) ->
        myUser: "myUser"

PaidTillConnected = withLang(ConnectedComponent(PaidTill, paidTillOptions))

BottomPanel = (props) ->
    <div className={ if props.theme == "dark" then styles.footer_dark else styles.footer}>
        <Grid fluid>
            <Row>
                <Col xs={12} sm={12} md={8} lg={8}>
                    <div className="text-muted">
                        <Link to="/">algoprog.ru</Link>
                        {" © "}{Lang('Petr_Kalinin')}{", GNU AGPL, "}
                        <a href="https://github.com/petr-kalinin/algoprog">github.com/petr-kalinin/algoprog</a>
                        {" | "}
                        <Link to="/material/license">{Lang("about_license")}</Link>
                        {" | "}
                        <a href="https://blog.algoprog.ru" target="_blank">{Lang("blog")}</a>
                    </div>
                </Col>
                <Col xs={12} sm={12} md={4} lg={4}>
                    <div className={styles.right + " text-muted"}>
                        <PaidTillConnected/>
                    </div>
                </Col>
            </Row>
        </Grid>
    </div>


fixSize = (prop, def) ->
    result = {def...}
    switch prop
        when "hide"
            for key, val of result
                result[key] = 0
        when "force"
            for key, val of result
                if result[key] == 0
                    result[key] = 12
    return result


getSizes = (props) ->
    treeSize = fixSize(props.showTree, {
        xs: 0
        sm: 0
        md: 4
        lg: 3
    })
    newsSize = fixSize(props.showNews, {
        xs: 0
        sm: 0
        md: 0
        lg: 3
    })
    selfSize = {}
    for size in SIZES
        selfSize[size] = 12 - treeSize[size] - newsSize[size]
        if selfSize[size] < 6
            selfSize[size] = 12

    return {treeSize, newsSize, selfSize}

BottomPanel = withTheme(BottomPanel)

class Sceleton extends React.Component
    constructor: (props) ->
        super(props)
        @state =
            showTree: props.showTree
            showNews: props.showNews
        @toggleTree = @toggleTree.bind(this)

    toggleTree: () ->
        newTree = if @state.showTree == "force" then "hide" else "force"
        @setState({@state..., showTree: newTree})

    render: () ->
        path = @props.location.path || DEFAULT_PATH
        breadPath = path.concat
            _id: @props.location._id
            title: @props.location.title
        {treeSize, newsSize, selfSize} = getSizes(@state)
        <div className={styles.wrapper}>
            <Helmet>
                {@props.location?.title && <title>{@props.location?.title}</title>}
            </Helmet>
            <TopPanel me={@props.me} myUser={@props.myUser} toggleTree={@toggleTree}/>
            <div className={styles.main}>
                {@props.lang == "en" &&
                    <div class={'alert alert-warning ' + styles.en_warning}>
                        English version is under construction. All contents of the site should be already translated (mostly using machine translation), but some functions may not work properly. Please contact me if you find any problems.
                    </div>
                }
                <Grid fluid>
                    <Row>
                        <ColWrapper size={treeSize}>
                            <Tree tree={@props.tree} path={@props.location?.path || []} id={@props.location?._id} />
                        </ColWrapper>
                        <ColWrapper size={selfSize}>
                            {@props.hideBread || <Bread path={breadPath} id={@props.location._id} /> }
                            {@props.children}
                        </ColWrapper>
                        <ColWrapper size={newsSize}>
                            <News/>
                            <BlogPosts/>
                            <CommentList />
                        </ColWrapper>
                    </Row>
                </Grid>
            </div>
            <BottomPanel myUser={@props.myUser} />
        </div>

export default withLang Sceleton