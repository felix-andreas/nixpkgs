{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, pbr
, requests
, pycryptodome
, pyjwt
, pytestCheckHook
, requests-mock
, time-machine
}:

buildPythonPackage rec {
  pname = "bimmer-connected";
  version = "0.8.5";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "bimmerconnected";
    repo = "bimmer_connected";
    rev = version;
    hash = "sha256-twVI84YCW+t9ar2vHN1OEiY5tT4/pHP29GnpWprdeHs=";
  };

  nativeBuildInputs = [
    pbr
  ];

  PBR_VERSION = version;

  propagatedBuildInputs = [
    requests
    pycryptodome
    pyjwt
  ];

  checkInputs = [
    pytestCheckHook
    requests-mock
    time-machine
  ];

  meta = with lib; {
    description = "Library to read data from the BMW Connected Drive portal";
    homepage = "https://github.com/bimmerconnected/bimmer_connected";
    license = licenses.asl20;
    maintainers = with maintainers; [ dotlambda ];
  };
}
