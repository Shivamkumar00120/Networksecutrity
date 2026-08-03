'''
the setup.py file is used to package and distribute the NetworkSecurity project.
It specifies the project's metadata, dependencies, and other configuration details required for installation.
The get_requirements function reads the requirements.txt file to gather the list of dependencies needed for the project.
'''

from setuptools import setup, find_packages,setup
from typing import List
def get_requirements() -> List[str]:
    """
    This function will return the list of requirements
    """
    requirement_lst: List[str] = []
    try:
        with open("requirements.txt",'r') as file:
            #read line form the file 
            lines=file.readlines()
            ## proceed each line
            for line in lines:
                requirement=line.strip()
                ## ignore empty lines and -e .
                if requirement and requirement != '-e .':
                    requirement_lst.append(requirement)      
    except FileNotFoundError:
        print("requirements.txt file not found.")
    return requirement_lst
print(get_requirements())


setup(
    name="NetworkSecurity",
    version="0.0.1",
    author="Shivam kumar",
    author_email="shivamkumar032324@gmail.com",
    packages=find_packages(),
    install_requires=get_requirements()
)