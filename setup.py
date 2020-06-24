from setuptools import setup
import sys

if not sys.version_info[0] == 3 and sys.version_info[1] < 5:
    sys.exit("Python < 3.5 is not supported")

setup(
    name="prometheus-f2b-exporter",
    python_requires=">=3.5",
    version="2020.6.1",
    description="Fail2ban prometheus exporter.",
    scripts=["prometheus-f2b-exporter"],
)