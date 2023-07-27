local dap = require('dap')
dap.adapters.java = {
	type = 'executable';
	command = os.getenv('/Program Files/Java/jdk-19');
	args = { '-m', 'debugjava.adapter' };
}

dap.configurations.java = {
	{
		type = 'java';
		request = 'attach';
		name = "Debug (Attach) - Remote";
		hostName = "127.0.0.1";
		port = 5005;
	},
}
dap.configurations.java = {
	{
		projectName = "${relativeFileDirname}";
		javaExec = "c:/Program Files/Java/jdk-19";
		mainClass = "${file}";
		name = "${file}";
		request = "launch";
		typ = "java"
	},
}
