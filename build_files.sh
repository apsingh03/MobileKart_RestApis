
echo " BUILD START"
python -m venv venv
venv/Scripts/activate
python3.9  -m pip install -r requirements.txt
python3.9 manage.py collectstatic  --noinput --clear
echo " BUILD END"
