from colors import Colors as c
import os

def main():
	message = os.environ.get("DB_MESSAGE")
	print(c.blue + "[+] Message: " + c.ENDC + message)

if __name__=="__main__":
	main()
