import stat


def test_jenkins_group(host):
    """
    Ensure that the group jenkins is present and that jenkins user is a member of it
    """
    assert host.group("jenkins").exists
    assert host.group("jenkins").gid == 1000

    assert host.user("jenkins").exists
    assert "jenkins" in host.user("jenkins").groups
    assert host.user("jenkins").home == "/home/jenkins"

    assert host.user("jenkins").shell == "/bin/bash"


def test_jenkins_home(host):
    """
    Ensure that the jenkins user owns its own home directory
    """

    jenkins_home = host.file("/home/jenkins")
    assert jenkins_home.exists
    assert jenkins_home.is_directory
    assert jenkins_home.user == "jenkins"
    assert jenkins_home.mode == 493


def test_agent(host):
    """
    Ensure that the agent startup script is present and properly configured
    """
    agent_jar = host.file("/usr/share/jenkins/agent.jar")
    start_script = host.file("/usr/local/bin/jenkins-agent")

    assert agent_jar.exists
    assert agent_jar.mode == 420
    assert agent_jar.user == "root"
    assert agent_jar.group == "root"

    assert host.exists("jenkins-agent")


def test_curl(host):
    """
    Ensure that we have access to curl so that we can get tools if we need to
    """

    assert host.exists("curl")
