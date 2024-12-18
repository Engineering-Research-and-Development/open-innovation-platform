<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>

<@layout.registrationLayout displayMessage=false; section>
<!-- template: terms.ftl -->

    <#if section = "header">
        ${msg("termsTitle")}
    <#elseif section = "form">
    <div>
        <p>${kcSanitize(msg("termsText", client.name))?no_esc}</p>
        <#if client.attributes.policyUri?? || client.attributes.tosUri??>
            <p class="mt-4">
                <#if client.attributes.tosUri?? || client.attributes.policyUri??>
                    ${msg("oauthGrantReview")}
                </#if>
                <#if client.attributes.tosUri??>
                    <a class="text-brand-600 capitalize" href="${client.attributes.tosUri}" target="_blank">${msg("oauthGrantTos")}</a>
                </#if>
                <#if client.attributes.tosUri?? && client.attributes.policyUri??>
                    &
                </#if>
                <#if client.attributes.policyUri??>
                    <a class="text-brand-600 capitalize" href="${client.attributes.policyUri}" target="_blank">${msg("oauthGrantPolicy")}</a>
                </#if>
            </p>
        </#if>
    </div>
    <form action="${url.loginAction}" method="POST">
        <@buttons.actionGroup>
            <@buttons.buttonOutline name="cancel" id="kc-decline" label="doDecline"/>
            <@buttons.button name="accept" id="kc-accept" label="doAccept"/>
        </@buttons.actionGroup>
    </form>
    <div class="clearfix"></div>
    </#if>
</@layout.registrationLayout>
