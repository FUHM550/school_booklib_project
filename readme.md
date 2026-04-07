Proyecto libreria 



1. Prerequisites (Software Needed)
    Linux (Ubuntu/Debian)
        Python 3.10+: Usually pre-installed.

        python3-venv: Required for the virtual environment 
                
                sudo apt install python3-venv   

        VS Code, or similar IDE. 

        SQLite3: To manage the database via terminal [optional].


    Windows
        Python 3.x: download from python.org. note: user must check the box "Add Python to PATH", path into project.

        VS Code: Downloaded from the official site.

        C++ Build Tools: Sometimes required by Python libraries, though not strictly for Flask/SQLite.




   2. Tools
   
    Python 3	            Handles the server-side logic and DB connection.

	Flask	                The "micro-framework" that routes URLs to functions.

	SQLite	                A file-based SQL engine (no server installation required).

	HTML5 / CSS3	        The structure and design of the UI.

	JavaScript          	Handles UI transitions and button clicks.
	
    venv	                Isolates project dependencies (PEP 668 compliant).

   3.commands 

        Task             |   Linux Command	           |     Windows (PowerShell)
    Create Venv	python3  | -m venv venv	               |  python -m venv venv
    Activate Venv	     | source venv/bin/activate    |  .\venv\Scripts\activate
    Install Flask	     | pip install flask	       |  pip install flask
    Run App	python3      | app.py	                   |  python app.py


               commands to open project in websocket for linux:

        cd ~/home/school_booklib_project/venv/bin
        source activate
        cd ../..
        python3 app.py