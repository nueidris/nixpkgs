{ lib
, fetchFromGitHub
, python3Packages
, pythonOlder
, p7zip
}:

python3Packages.buildPythonApplication rec {
  pname = "kcc";
  version = "5.7.0";

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "ciromattia";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-LUUKCSjVrqlnkMnnx1h0BUZ/0rO/ezlIwgXE9wq9uQQ=";
  };

  propagatedBuildInputs = with python3Packages; [
    distro
    mozjpeg-lossless-optimization
    natsort
    p7zip
    pillow
    psutil
    pyside6
    python-slugify
    raven
    requests
  ];

  meta = with lib; {
    changelog = "https://github.com/${src.owner}/${pname}/releases/tag/v${version}";
    description = "A comic and manga converter for ebook readers.";
    homepage = "https://github.com/${src.owner}/${pname}/";
    license = licenses.isc;
    maintainers = with maintainers; [ dawidsowa nueidris ];
  };
}
