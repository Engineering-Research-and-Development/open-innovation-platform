<#import "template.ftl" as layout>
<#import "buttons.ftl" as buttons>
<@layout.registrationLayout displayMessage=false; section>
    <#if section="header">
        ${kcSanitize(msg("errorTitle"))?no_esc}
        <#elseif section="form">
            <div id="kc-error-message" class="my-10">
                <div class="instruction alert-general">
                    <div class="flex flex-col gap-4">
                        <span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" aria-hidden="true" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.5"><path stroke-linecap="round" d="M22 14.353C22 17.472 19.442 20 16.286 20H11m3.381-10.973a5.8 5.8 0 0 1 1.905-.321c.654 0 1.283.109 1.87.309m-11.04 2.594a4.4 4.4 0 0 0-.83-.08C3.919 11.53 2 13.426 2 15.765S3.919 20 6.286 20H7m.116-8.391a5.6 5.6 0 0 1-.354-1.962C6.762 6.528 9.32 4 12.476 4c2.94 0 5.361 2.194 5.68 5.015m-11.04 2.594a4.3 4.3 0 0 1 1.55.634m9.49-3.228A5.7 5.7 0 0 1 20 10.061"/><path d="M11 4a5 5 0 1 0-6 7.584"/></g></svg>
                        </span>
                        <span>${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </div>
                <#if skipLink??>
                    <#else>
                        <#if client?? && client.baseUrl?has_content>
                            <div class="mt-10">
                                <@buttons.buttonLink href=client.baseUrl id="backToApplication" label="backToApplication" class=[] />
                            </div>
                        </#if>
                </#if>
            </div>
    </#if>
</@layout.registrationLayout>