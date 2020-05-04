React = require('react')
FontAwesome = require('react-fontawesome')

import { Link } from 'react-router-dom'

import styles from './Level.css'

Label = (props) ->
    <div dangerouslySetInnerHTML={{__html: props.material.content}}>
    </div>

SubLevel = (props) ->
    inner = props.material.title
    if not props.noLink
        inner = <a href="/material/#{props.material._id}">{inner}</a>
    if props.material.sub
        <div>{inner}</div>
    else
        <h2>{inner}</h2>

InternalLink = (props) ->
    <div>
        <Link to={props.material.content}>{props.material.title}</Link>
    </div>

MaterialLink = (props) ->
    <div className={props.className && styles[props.className]}>
        <Link to={"/material/" + props.material._id}>{props.material.title}</Link>
    </div>

ExternalLink = (props) ->
    <div>
        <FontAwesome name={props.head}/> <a href={props.material.content}>{props.material.title}</a>
    </div>

Material = (props) ->
    switch props.material.type
        when 'label' then `<Label {...props}/>`
        when 'page' then `<MaterialLink {...props}/>`
        when 'pdf' then `<ExternalLink head="file-pdf-o" {...props}/>`
        when 'image' then `<ExternalLink head="picture-o" {...props}/>`
        when 'link' then `<ExternalLink head="external-link" {...props}/>`
        when 'contest' then `<MaterialLink {...props}/>`
        when 'level' then `<SubLevel {...props}/>`
        when 'topic' then `<SubLevel {...props} noLink={true}/>`
        when 'epigraph' then `<MaterialLink {...props} className="epigraph"/>`
        when 'table' then `<InternalLink {...props}/>`
        else <div>{props.material.type}</div>

export default Level = (props) ->
    <div>
    <h1>{props.material.title}</h1>
    {
    res = []
    a = (el) -> res.push(el)
    for m in props.material.materials
        a(<div key={m._id + ":" + m.type}>
            <Material material={m}/>
        </div>)
    res}
    </div>
