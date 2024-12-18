<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout bodyClass="oauth"; section>
    <#if section = "header">
        <#if client.attributes.logoUri??>
            <img class="w-16 h-16 my-4" alt="Client Logo" src="${client.attributes.logoUri}"/>
        <#else>
            <svg xmlns="http://www.w3.org/2000/svg" class="w-16 h-16" viewBox="0 0 24 24"><g fill="none"><path fill="url(#fluentColorBuildingPeople240)" d="M4 4.25A2.25 2.25 0 0 1 6.25 2h7.5A2.25 2.25 0 0 1 16 4.25V9.5h1.75A2.25 2.25 0 0 1 20 11.75V21h-2v1H4.75a.75.75 0 0 1-.75-.75z"/><path fill="url(#fluentColorBuildingPeople247)" d="M4 4.25A2.25 2.25 0 0 1 6.25 2h7.5A2.25 2.25 0 0 1 16 4.25V9.5h1.75A2.25 2.25 0 0 1 20 11.75V21h-2v1H4.75a.75.75 0 0 1-.75-.75z"/><path fill="url(#fluentColorBuildingPeople248)" d="M4 4.25A2.25 2.25 0 0 1 6.25 2h7.5A2.25 2.25 0 0 1 16 4.25V9.5h1.75A2.25 2.25 0 0 1 20 11.75V21h-2v1H4.75a.75.75 0 0 1-.75-.75z"/><path fill="url(#fluentColorBuildingPeople249)" d="M4 4.25A2.25 2.25 0 0 1 6.25 2h7.5A2.25 2.25 0 0 1 16 4.25V9.5h1.75A2.25 2.25 0 0 1 20 11.75V21h-2v1H4.75a.75.75 0 0 1-.75-.75z"/><path fill="url(#fluentColorBuildingPeople24a)" d="M4 4.25A2.25 2.25 0 0 1 6.25 2h7.5A2.25 2.25 0 0 1 16 4.25V9.5h1.75A2.25 2.25 0 0 1 20 11.75V21h-2v1H4.75a.75.75 0 0 1-.75-.75z"/><path fill="url(#fluentColorBuildingPeople241)" d="M7 6.5a1 1 0 1 0 2 0a1 1 0 0 0-2 0m1 6a1 1 0 1 0 0 2a1 1 0 0 0 0-2M8 9a1 1 0 1 0 0 2a1 1 0 0 0 0-2m4-3.5a1 1 0 1 0 0 2a1 1 0 0 0 0-2M12 9a1 1 0 1 0 0 2a1 1 0 0 0 0-2"/><path fill="url(#fluentColorBuildingPeople242)" d="M20 22c2.2 0 3-1.216 3-2.4a1.6 1.6 0 0 0-1.6-1.6h-2.8a1.6 1.6 0 0 0-1.6 1.6c0 1.183.8 2.4 3 2.4"/><path fill="url(#fluentColorBuildingPeople24b)" fill-opacity=".5" d="M20 22c2.2 0 3-1.216 3-2.4a1.6 1.6 0 0 0-1.6-1.6h-2.8a1.6 1.6 0 0 0-1.6 1.6c0 1.183.8 2.4 3 2.4"/><path fill="url(#fluentColorBuildingPeople243)" d="M20 17a1.5 1.5 0 1 0 0-3a1.5 1.5 0 0 0 0 3"/><path fill="url(#fluentColorBuildingPeople244)" d="M15.5 23c2.567 0 3.5-1.52 3.5-3a2 2 0 0 0-2-2h-3a2 2 0 0 0-2 2c0 1.48.933 3 3.5 3"/><path fill="url(#fluentColorBuildingPeople245)" d="M15.5 23c2.567 0 3.5-1.52 3.5-3a2 2 0 0 0-2-2h-3a2 2 0 0 0-2 2c0 1.48.933 3 3.5 3"/><path fill="url(#fluentColorBuildingPeople246)" d="M15.5 17a2 2 0 1 0 0-4a2 2 0 0 0 0 4"/><defs><linearGradient id="fluentColorBuildingPeople240" x1="4" x2="23.081" y1="2.625" y2="22.168" gradientUnits="userSpaceOnUse"><stop stop-color="#29C3FF"/><stop offset="1" stop-color="#2764E7"/></linearGradient><linearGradient id="fluentColorBuildingPeople241" x1="9.15" x2="13.953" y1="4.5" y2="15.067" gradientUnits="userSpaceOnUse"><stop stop-color="#FDFDFD"/><stop offset="1" stop-color="#B3E0FF"/></linearGradient><linearGradient id="fluentColorBuildingPeople242" x1="18.427" x2="20.038" y1="18.532" y2="22.391" gradientUnits="userSpaceOnUse"><stop offset=".125" stop-color="#9C6CFE"/><stop offset="1" stop-color="#7A41DC"/></linearGradient><linearGradient id="fluentColorBuildingPeople243" x1="19.213" x2="20.742" y1="14.399" y2="16.84" gradientUnits="userSpaceOnUse"><stop offset=".125" stop-color="#9C6CFE"/><stop offset="1" stop-color="#7A41DC"/></linearGradient><linearGradient id="fluentColorBuildingPeople244" x1="13.665" x2="15.776" y1="18.665" y2="23.385" gradientUnits="userSpaceOnUse"><stop offset=".125" stop-color="#BD96FF"/><stop offset="1" stop-color="#9C6CFE"/></linearGradient><linearGradient id="fluentColorBuildingPeople245" x1="15.5" x2="18.521" y1="17.405" y2="25.308" gradientUnits="userSpaceOnUse"><stop stop-color="#885EDB" stop-opacity="0"/><stop offset="1" stop-color="#E362F8"/></linearGradient><linearGradient id="fluentColorBuildingPeople246" x1="14.451" x2="16.49" y1="13.532" y2="16.787" gradientUnits="userSpaceOnUse"><stop offset=".125" stop-color="#BD96FF"/><stop offset="1" stop-color="#9C6CFE"/></linearGradient><radialGradient id="fluentColorBuildingPeople247" cx="0" cy="0" r="1" gradientTransform="matrix(5.6875 .0625 -.05412 4.92472 14.313 20.656)" gradientUnits="userSpaceOnUse"><stop stop-color="#4A43CB"/><stop offset=".914" stop-color="#4A43CB" stop-opacity="0"/></radialGradient><radialGradient id="fluentColorBuildingPeople248" cx="0" cy="0" r="1" gradientTransform="matrix(5.875 -.125 .10824 5.08708 19.438 19.719)" gradientUnits="userSpaceOnUse"><stop stop-color="#4A43CB"/><stop offset=".914" stop-color="#4A43CB" stop-opacity="0"/></radialGradient><radialGradient id="fluentColorBuildingPeople249" cx="0" cy="0" r="1" gradientTransform="matrix(.0625 3.53125 -3.76667 .06667 15.75 15.875)" gradientUnits="userSpaceOnUse"><stop stop-color="#4A43CB"/><stop offset="1" stop-color="#4A43CB" stop-opacity="0"/></radialGradient><radialGradient id="fluentColorBuildingPeople24a" cx="0" cy="0" r="1" gradientTransform="rotate(91.45 2.588 17.915)scale(2.46954 2.63418)" gradientUnits="userSpaceOnUse"><stop stop-color="#4A43CB"/><stop offset="1" stop-color="#4A43CB" stop-opacity="0"/></radialGradient><radialGradient id="fluentColorBuildingPeople24b" cx="0" cy="0" r="1" gradientTransform="matrix(3.94861 -.58333 .6871 4.65104 16.239 20)" gradientUnits="userSpaceOnUse"><stop offset=".392" stop-color="#3B148A"/><stop offset="1" stop-color="#3B148A" stop-opacity="0"/></radialGradient></defs></g></svg>
        </#if>
        <p class="mb-4">
            <#if client.name?has_content>
                ${msg("oauthGrantTitle",advancedMsg(client.name))}
            <#else>
                ${msg("oauthGrantTitle",client.clientId)}
            </#if>
        </p>
    <#elseif section = "form">
        <div id="kc-oauth" class="w-full">
            <h3 class="mb-3">${msg("oauthGrantRequest")}</h3>
            <ul class="w-full flex-wrap flex items-center gap-3">
                <#if oauth.clientScopesRequested??>
                    <#list oauth.clientScopesRequested as clientScope>
                        <li >
                            <div class="py-0.5 px-2 border border-brand-400 text-brand-700 bg-brand-50 rounded-md text-sm">
                                <#if !clientScope.dynamicScopeParameter??>
                                        ${advancedMsg(clientScope.consentScreenText)}
                                    <#else>
                                        ${advancedMsg(clientScope.consentScreenText)}: <b>${clientScope.dynamicScopeParameter}</b>
                                </#if>
                            </div>
                        </li>
                    </#list>
                </#if>
            </ul>
            <#if client.attributes.policyUri?? || client.attributes.tosUri??>
                <h3 class="my-4">
                    <#if client.name?has_content>
                        ${msg("oauthGrantInformation",advancedMsg(client.name))}
                    <#else>
                        ${msg("oauthGrantInformation",client.clientId)}
                    </#if>

                </h3>
                <p>
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

            <form action="${url.oauthAction}" method="POST">
                <input type="hidden" name="code" value="${oauth.code}">
                <@buttons.actionGroup>
                    <@buttons.buttonOutline id="kc-cancel" name="cancel" label="doNo"/>
                    <@buttons.button id="kc-login" name="accept" label="doYes"/>
                </@buttons.actionGroup>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
