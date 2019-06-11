ConvertFrom-StringData @'
    GettingListenerMessage = Getting Listener.
    ListenerExistsMessage = {0} Listener exists.
    ListenerDoesNotExistMessage = {0} Listener does not exist.
    SettingListenerMessage = Setting Listener.
    EnsureListenerExistsMessage = Ensuring {0} Listener on port {1} exists.
    EnsureListenerDoesNotExistMessage = Ensuring {0} Listener on port {1} does not exist.
    ListenerExistsRemoveMessage = {0} Listener on port {1} exists. Removing.
    ListenerOnPortDoesNotExistMessage = {0} Listener on port {1} does not exist.
    CreatingListenerMessage = Creating {0} Listener on port {1}.
    ListenerCreateFailNoCertError = Failed to create {0} Listener on port {1} because an applicable certificate could not be found.
    TestingListenerMessage = Testing Listener.
    ListenerOnWrongPortMessage = {0} Listener is on port {1}, should be on {2}. Change required.
    ListenerOnWrongAddressMessage = {0} Listener is bound to {1}, should be {2}. Change required.
    ListenerDoesNotExistButShouldMessage = {0} Listener does not exist but should. Change required.
    ListenerExistsButShouldNotMessage = {0} Listener exists but should not. Change required.
    ListenerDoesNotExistAndShouldNotMessage = {0} Listener does not exist and should not. Change not required.
    FindCertificateAlternateMessage = Looking for machine server certificate with subject '{0}' issued by '{1}' and DNS name '{2}'.
    FindCertificateMessage = Looking for machine server certificate with subject '{0}' issued by '{1}'.
    FindCertificateByThumbprintMessage = Looking for machine server certificate with thumbprint '{0}'.
    CertificateFoundMessage = Certificate found with thumbprint '{0}' to use for HTTPS Listener.
    CertificateNotFoundMessage = Certificate not found.
'@
