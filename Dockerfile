FROM quay.io/oauth2-proxy/oauth2-proxy

COPY email_list.txt /site_config/
COPY _site /app/

ENTRYPOINT ["/bin/oauth2-proxy", \
            "--provider", "google", \
            "--upstream", "file:///app/#/", \
            "--authenticated-emails-file", "/site_config/email_list.txt", \
            "--cookie-expire=0h0m30s", \
            "--skip-provider-button=true"]
