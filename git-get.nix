{ buildGo118Module }:
buildGo118Module {
  pname = "git-get";
  version = "0.1.0";
  src = builtins.path { path = ./.; };
  CGO_ENABLED = 0;
  vendorSha256 = "sha256-Z0H01Ts6RlBFwKgx+9YYAd9kT4BkCBL1mvJsRf2ci5I=";
}
