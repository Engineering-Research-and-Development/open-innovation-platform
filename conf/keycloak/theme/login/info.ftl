<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
    <div id="kc-info-message">
        <p class="mb-3">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#items></b></#list><#else></#if></p>
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <@buttons.buttonLink href=pageRedirectUri label="backToApplication" class=[]/>
            <#elseif actionUri?has_content>
                <@buttons.buttonLink href=actionUri label="proceedWithAction" class=[]/>
            <#elseif (client.baseUrl)?has_content>
                <@buttons.buttonLink href=client.baseUrl label="backToApplication" class=[]/>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>