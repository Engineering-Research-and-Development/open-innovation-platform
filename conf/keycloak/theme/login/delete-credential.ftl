<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>

<@layout.registrationLayout displayMessage=false; section>
<!-- template: delete-credential.ftl -->

    <#if section = "header">
        ${msg("deleteCredentialTitle", credentialLabel)}
    <#elseif section = "form">
        <div id="kc-delete-text" class="text-gray-700">
            ${msg("deleteCredentialMessage", credentialLabel)}
        </div>

        <form action="${url.loginAction}" method="POST">
            <@buttons.actionGroup>
                <@buttons.buttonOutline name="cancel-aia" id="kc-decline" label="doDecline" class=[]/>
                <@buttons.button name="accept" id="kc-accept" label="doConfirmDelete" class=[]/>
            </@buttons.actionGroup>
        </form
    </#if>
</@layout.registrationLayout>
