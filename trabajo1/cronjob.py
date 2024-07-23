from colors import Colors as c
import schedule
import time
import os
import sys
import signal

def handler(signal, frame):
	print(c.FAIL + "\n  [!] Exiting..." +  c.ENDC)
	sys.exit(0)

#CTRL + C
signal.signal(signal.SIGINT, handler)


def job():
	os.system("python3 /home/moreno/Desktop/dbClases/trabajo1/executable.py")

def main():

	exec_time = os.environ.get("DB_TIME")
	print(c.WARNING + "[+] Time: " + c.ENDC + exec_time + "\n")

	schedule.every(int(exec_time)).seconds.do(job)

	while True:
		schedule.run_pending()
		time.sleep(1)

if __name__ == "__main__":
	main()
