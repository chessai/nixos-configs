self: super: {
  chainweb-node = import (super.fetchFromGitHub {
    owner = "kadena-io";
    repo = "chainweb-node";
    rev = "53b6c6d5beb645f7e136b36e902631d2bbb26dcf";
    sha256 = "15w7sw2lx2y09wz4wzwsi6536x02qy5cn3w96ls0siadp8six58m";
  });
}
