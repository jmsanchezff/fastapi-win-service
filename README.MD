# FastAPI service running as a Windows Service

This is an example of how to run a FastAPI app as a Windows Service. The service is lauched by Uvicorn web server with 
adapted number of workers to the server machine CPU capability, in order to give an optimum service to the API 
consumers.

This approach allows to the API endpoints to be accessed via IIS redirections of the trafic reaching the server from
outside, or from the processes running in the same machine via localhost network loopback. 

# Description
This approach is an adaptation of the implementation done here:

https://github.com/msminhas93/fastapi-windows-service

Unlike that approach that uses Conda or Miniconda, this example is fully implemented on standard Python 3

The idea under the hoods is to build 2 executables:
- One of the executables is the Uvicorn server running the FastAPI app.
- The other is a Windows Service that is installed and launches the previous one.

The Windows service is installed and managed by Windows WMI, and its configured with autostart in such a way that the
service is automatically started on the start of the host machine

In principle, any FastAPI application developed could be installed, executed and managed as a Windows Service following
this approach.


# Requirements

**Python 3.11** installed (it is possible that it works from Python 3.9)

**Administration privileges** on the server machine



# Steps for installing the service
1. Clone this repo
2. From the root of the repo directory run the script **build_and_install_windows_service.bat** with Administration privileges


The service will be installed on your system in auto run mode.

You can start, stop, restart the service manually from the Services window.

Your service will be visible in the Task Manager details tab.

The Uvicorn server would be available at localhost:5000. 

You can check the API swagger at localhost:5000/docs.

# Uninstalling the service
From the root of the repository in a PowerShell terminal, run script **uninstall_windows_service.ps1** with elevated
privileges.
