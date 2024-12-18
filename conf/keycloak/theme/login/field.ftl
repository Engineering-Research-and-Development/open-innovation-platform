<#--  INPUT_LABEL  -->
<#macro group name label error="" required=false>
  <div class="type-input-label">
    <div class="text-sm mb-2">
      <label for="${name}">
          <span class="text-gray-700">
            ${label}
          </span>
          <#if required>
            <span class="text-red-600" aria-hidden="true">&#42;</span>
          </#if>
      </label>
    </div>

    <#nested>

    <div id="input-error-client-${name}"></div>
    <#if error?has_content>
      <div class="text-sm text-red-600" id="input-error-${name}" aria-live="polite">
        <span>${error}</span>
      </div>
    </#if>
  </div>
</#macro>

<#macro errorIcon error="">
  <#if error?has_content>
    <span class="text-red-600 flex">*</span>
  </#if>
</#macro>

<#--  INPUT_TEXT  -->
<#macro input name label value="" required=false autocomplete="off" fieldName=name autofocus=false>
  <#assign error=kcSanitize(messagesPerField.get(fieldName))?no_esc>
  <@group name=name label=label error=error required=required>
    <div>
        <input class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full" id="${name}" name="${name}" value="${value}" type="text" autocomplete="${autocomplete}" <#if autofocus>autofocus</#if> aria-invalid="<#if error?has_content>true</#if>"/>
    </div>
  </@group>
</#macro>

<#--  INPUT_PASSWORD  -->
<#macro password name label value="" required=false forgotPassword=false fieldName=name autocomplete="off" autofocus=false>
  <#assign error=kcSanitize(messagesPerField.get(fieldName))?no_esc>
  <@group name=name label=label error=error required=required>
    <div class="flex item-center gap-3 w-full">
      <div class="w-full">
          <input class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500 w-full" id="${name}" name="${name}" value="${value}" type="password" autocomplete="${autocomplete}" <#if autofocus>autofocus</#if> aria-invalid="<#if error?has_content>true</#if>"/>
      </div>
      <div>
        <button class="px-4 py-2.5 bg-white text-gray-800 rounded-lg border border-gray-300 focus:outline-none focus:border-brand-300 focus:border-dashed focus:ring-1 focus:ring-offset-2 focus:ring-brand-500" type="button" aria-label="${msg('showPassword')}"
                aria-controls="${name}" data-password-toggle
                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
            <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" class="w-6 h-6 text-gray-500 hover:text-brand-600" viewBox="0 0 24 24"><path fill="currentColor" d="M14 2.75c1.907 0 3.262.002 4.29.14c1.005.135 1.585.389 2.008.812c.487.487.7.865.817 1.538c.132.759.135 1.84.135 3.76a.75.75 0 0 0 1.5 0v-.096c0-1.8 0-3.018-.158-3.922c-.175-1.005-.549-1.656-1.233-2.34c-.749-.75-1.698-1.081-2.87-1.239c-1.14-.153-2.595-.153-4.433-.153H14a.75.75 0 0 0 0 1.5M2 14.25a.75.75 0 0 1 .75.75c0 1.92.003 3.001.135 3.76c.118.673.33 1.051.817 1.538c.423.423 1.003.677 2.009.812c1.028.138 2.382.14 4.289.14a.75.75 0 0 1 0 1.5h-.056c-1.838 0-3.294 0-4.433-.153c-1.172-.158-2.121-.49-2.87-1.238c-.684-.685-1.058-1.336-1.233-2.341c-.158-.904-.158-2.123-.158-3.922V15a.75.75 0 0 1 .75-.75m20 0a.75.75 0 0 1 .75.75v.096c0 1.8 0 3.018-.158 3.922c-.175 1.005-.549 1.656-1.233 2.34c-.749.75-1.698 1.081-2.87 1.239c-1.14.153-2.595.153-4.433.153H14a.75.75 0 0 1 0-1.5c1.907 0 3.262-.002 4.29-.14c1.005-.135 1.585-.389 2.008-.812c.487-.487.7-.865.817-1.538c.132-.759.135-1.84.135-3.76a.75.75 0 0 1 .75-.75m-12.056-13H10a.75.75 0 0 1 0 1.5c-1.907 0-3.261.002-4.29.14c-1.005.135-1.585.389-2.008.812c-.487.487-.7.865-.817 1.538c-.132.759-.135 1.84-.135 3.76a.75.75 0 1 1-1.5 0v-.096c0-1.8 0-3.018.158-3.922c.175-1.005.549-1.656 1.233-2.34c.749-.75 1.698-1.081 2.87-1.239c1.14-.153 2.595-.153 4.433-.153M12 10.75a1.25 1.25 0 1 0 0 2.5a1.25 1.25 0 0 0 0-2.5"/><path fill="currentColor" fill-rule="evenodd" d="M5.892 14.06C5.297 13.37 5 13.025 5 12s.297-1.37.892-2.06C7.08 8.562 9.072 7 12 7s4.92 1.562 6.108 2.94c.595.69.892 1.035.892 2.06s-.297 1.37-.892 2.06C16.92 15.438 14.928 17 12 17s-4.92-1.562-6.108-2.94M9.25 12a2.75 2.75 0 1 1 5.5 0a2.75 2.75 0 0 1-5.5 0" clip-rule="evenodd"/></svg>
        </button>
      </div>
    </div>
      <#if forgotPassword>
        <div class="mt-4 flex items-center justify-end" aria-live="polite">
            <span class="text-gray-600 hover:text-brand-600 transition">
                <a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
            </span>
        </div>
      </#if>
  </@group>
</#macro>

<#--  INPUT_CHECKBOX  -->
<#macro checkbox name label value=false required=false>
  <div>
    <label for="${name}">
      <input
        class="rounded mb-1 focus:outline-none outline-none border border-brand-400 text-brand-600 ring-1 ring-brand-300/25 focus:ring-brand-300"
        type="checkbox"
        id="${name}"
        name="${name}"
        <#if value>checked</#if>
      />
      <span class="text-gray-800">${label}</span>
      <#if required>
        <span class="text-red-600" aria-hidden="true">&#42;</span>
      </#if>
    </label>
  </div>
</#macro>