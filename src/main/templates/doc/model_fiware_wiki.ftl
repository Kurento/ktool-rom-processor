MediaAPI.html
<!DOCTYPE html>
<html>

<h1>Remote Classes</h1>
<#list model.remoteClasses as remoteClass>

<table border="1" cellspacing="0" cellpading="0" width="60%">
    <tr>
        <td colspan="2">
            <font face="Courier New, monospace"><b id="${remoteClass.name}">${remoteClass.name}</b></font>
        </td>
    </tr>

    <#if remoteClass.extends??>
    <tr>
        <td>Parent Class</td>
        <td><font face="Courier New, monospace"><a href="#${remoteClass.extends.name}">${remoteClass.extends.name}</a></font></td>
    </tr>
    </#if>

    <#if !remoteClass.abstract && remoteClass.constructor??>
    <tr>
        <td>Constructor Parameters</td>
        <td><ul><#list remoteClass.constructor.params as param>
                <li><font face="Courier New, monospace"><a href="#${param.type.name}">${param.type.name}</a>
                <#if param.type.list>[]</#if>
                ${param.name}<#if param.optional>?</#if></font></li>
                </#list>
            </ul>
        </td>
    </tr>
    </#if>

    <tr>
        <td>Declared Methods</td>
        <td><ul><#list remoteClass.methods as method>
                <li><font face="Courier New, monospace">

                <#if method.return??><a href="#${method.return.type.name}">${method.return.type.name}</a><#if method.return.type.list>[]</#if></#if> ${method.name}<#rt>
                <#lt>(<#list method.params as param><#rt>
                <#lt><a href="#${param.type.name}">${param.type.name}</a><#if param.type.list>[]</#if> ${param.name}<#if param_has_next>, </#if><#rt>
                <#lt></#list>)
                </font></li>
                </#list>
            </ul>
        </td>
    </tr>

    <tr>
        <td>Declared Events</td>
        <td><ul><#list remoteClass.events as event>
                <li><font face="Courier New, monospace"><a href="#event-${event.name}">${event.name}</a></font></li>
                </#list>
            </ul>
        </td>
    </tr>

</table>

<br>
<br>

</#list>

<h1>Events</h1>
<#list model.events as event>

<table border="1" cellspacing="0" cellpading="0" width="60%">
    <tr>
        <td colspan="2">
            <font face="Courier New, monospace"><b id="event-${event.name}">${event.name}</b></font>
        </td>
    </tr>

    <#if event.extends??>
    <tr>
        <td>Parent Class</td>
        <td><font face="Courier New, monospace"><a href="#event-${event.extends.name}">${event.extends.name}</a></font></td>
    </tr>
    </#if>

    <tr>
        <td>Properties</td>
        <td><ul>
            <#list event.properties as property>
            <li><font face="Courier New, monospace">
                <a href="#${property.type.name}">${property.type.name}</a><#if property.type.list>[]</#if> ${property.name}
            </font></li>
            </#list>
            </ul>
        </td>
    </tr>

</table>

<br>
<br>
</#list>

<h1>Types</h1>
<#list model.complexTypes as type>

<table border="1" cellspacing="0" cellpading="0" width="60%">
    <tr>
        <td colspan="2">
            <font face="Courier New, monospace"><b id="${type.name}">${type.name}</b></font>
        </td>
    </tr>

    <#if type.typeFormat == "REGISTER">
    <tr>
        <td>Properties</td>
        <td><ul>
            <#list type.properties as property>
            <li><font face="Courier New, monospace">
                <a href="#${property.type.name}">${property.type.name}</a><#if property.type.list>[]</#if> ${property.name}<#if property.optional>?</#if>
            </font></li>
            </#list>
            </ul>
        </td>
    </tr>
    <#else>
    <tr>
        <td>Enum constants</td>
        <td><ul>
            <#list type.values as value>
            <li><font face="Courier New, monospace">
                ${value}
            </font></li>
            </#list>
            </ul>
        </td>
    </tr>
    </#if>

</table>

<br>
<br>
</#list>

</html>