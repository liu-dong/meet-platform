package com.meet.authserver.web.controller;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author LD
 */
@Controller
public class Hello {

    @GetMapping("/hello")
    @ResponseBody
    public String hello(String s) {
        if (StringUtils.isBlank(s)) {
            s = "hello world！";
        }
        return s;
    }

    @RequestMapping("/successPage")
    public String success() {
        return "redirect:successPage.html";
    }

    @RequestMapping("/errorPage")
    public String error() {
        return "redirect:errorPage";
    }


    /*@Override
    @RequestMapping("/getCode")
    public ModelAndView authorize(Map<String, Object> model, Map<String, String> parameters, SessionStatus sessionStatus, Principal principal) {
        AuthorizationRequest authorizationRequest = this.getOAuth2RequestFactory().createAuthorizationRequest(parameters);
        Set<String> responseTypes = authorizationRequest.getResponseTypes();
        if (!responseTypes.contains("token") && !responseTypes.contains("code")) {
            throw new UnsupportedResponseTypeException("Unsupported response types: " + responseTypes);
        } else if (authorizationRequest.getClientId() == null) {
            throw new InvalidClientException("A client id must be provided");
        } else {
            try {
                if (principal instanceof Authentication && ((Authentication)principal).isAuthenticated()) {
                    ClientDetails client = super.getClientDetailsService().loadClientByClientId(authorizationRequest.getClientId());
                    String redirectUriParameter = authorizationRequest.getRequestParameters().get("redirect_uri");
                    String resolvedRedirect = super.redirectResolver.resolveRedirect(redirectUriParameter, client);
                    if (!org.springframework.util.StringUtils.hasText(resolvedRedirect)) {
                        throw new RedirectMismatchException("A redirectUri must be either supplied or preconfigured in the ClientDetails");
                    } else {
                        authorizationRequest.setRedirectUri(resolvedRedirect);
                        super.oauth2RequestValidator.validateScope(authorizationRequest, client);
                        authorizationRequest = super.userApprovalHandler.checkForPreApproval(authorizationRequest, (Authentication)principal);
                        boolean approved = super.userApprovalHandler.isApproved(authorizationRequest, (Authentication)principal);
                        authorizationRequest.setApproved(approved);
                        if (authorizationRequest.isApproved()) {
                            if (responseTypes.contains("token")) {
                                return super.getImplicitGrantResponse(authorizationRequest);
                            }

                            if (responseTypes.contains("code")) {
                                return new ModelAndView(super.getAuthorizationCodeResponse(authorizationRequest, (Authentication)principal));
                            }
                        }

                        model.put("authorizationRequest", authorizationRequest);
                        model.put("org.springframework.security.oauth2.provider.endpoint.AuthorizationEndpoint.ORIGINAL_AUTHORIZATION_REQUEST", super.unmodifiableMap(authorizationRequest));
                        return super.getUserApprovalPageResponse(model, authorizationRequest, (Authentication)principal);
                    }
                } else {
                    throw new InsufficientAuthenticationException("User must be authenticated with Spring Security before authorization can be completed.");
                }
            } catch (RuntimeException var11) {
                sessionStatus.setComplete();
                throw var11;
            }
        }
    }*/
}
