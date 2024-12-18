<#macro termsAcceptance>
    <#if termsAcceptanceRequired??>
        <div class="form-group text-gray-800">
            <div id="kc-registration-terms-text">
                <p class="font-semibold">${msg("termsTitle")}</p> 
                <p class="my-4">${kcSanitize(msg("termsText", realm.displayName))?no_esc}</p>
                <#if client.attributes.policyUri?? || client.attributes.tosUri??>
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
            </div>
        </div>
        <div class="form-group text-gray-800">
            <div>
                <input 
                    type="checkbox" 
                    id="termsAccepted" 
                    name="termsAccepted" 
                    class="rounded mb-1 focus:outline-none outline-none border border-brand-400 text-brand-600 ring-1 ring-brand-300/25 focus:ring-brand-300"
                    aria-invalid="<#if messagesPerField.existsError('termsAccepted')>true</#if>"
                />
                <label for="termsAccepted">${msg("acceptTerms")}</label>
            </div>
            <#if messagesPerField.existsError('termsAccepted')>
                <span id="input-error-terms-accepted" class="text-sm text-red-600" aria-live="polite">
                    ${kcSanitize(messagesPerField.get('termsAccepted'))?no_esc}
                </span>
            </#if>
        </div>
    </#if>
</#macro>
