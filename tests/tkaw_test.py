"""
from __future__ import print_function
import os
import argparse
import plistlib


class SystemSettings:
    # --------------------------------------------------------------------
    # main
    def __init__(self, evidence_root, output_path):
        self.evidence_root = evidence_root
        self.output_path = output_path
        self.users_plist = {}
        self.plist_path_version = '/System/Library/CoreServices/SystemVersion.plist'
        self.plist_path_timezone = ''
        self.text = "----------------------------------------------------------\n"
        self.text += "[*] Volume positions from finder plist.\n"
        self.text += "[*] This attribute show the Volume name displayed on Desktop.\n"
 #       self.search()

    def parse_osversion(self, file_path):
        with open(file_path, 'rb') as file:
            osver_plist = plistlib.load(file)
            if osver_plist.get('ProductVersion') is None:
                self.text += "[-] ProductVersion are not found."
                print(self.text)
                return

            fieldnames = osver_plist.get('ProductVersion')
            print(fieldnames)


if __name__ == '__main__':

    # 準備
    args_parser = argparse.ArgumentParser()

    args_parser.add_argument('-r', '--root',
                             help="please input evidence root path:e.g. "
                                  "/Volumes/disk3s1/", type=str,
                             default="/Volumes/disk3s1/")
    args_parser.add_argument('-o', '--output',
                             help="please input output path:", type=str,
                             default=os.getcwd())
    # 結果を受ける
    args = args_parser.parse_args()
    plist_path_version = '/System/Library/CoreServices/SystemVersion.plist'
    ss = SystemSettings(args.root, args.output)
    ss.parse_osversion(plist_path_version)
    #ss.extract()
    #fd.output_txt()

"""
import plistlib
import xml.etree.ElementTree as ET
import tempfile


#with open('/Users/taco2/diskutil_list.xml','rb'):
#    return(xml)
#root = ET.fromstring(xml)

plist_path = '/Users/taco2/diskutil_list.xml'
with open(plist_path,'rb') as plist:
    f = plist.read()
    f = str(f)
    f = f.encode('utf-8')

    #pl = f
    #print(pl)
    temp = tempfile.TemporaryFile()
    temp.write(f)
    #temp.seek(0)
    with open(temp,'rb'):
        temp.read()
        print(temp)
    #with tempfile.TemporaryFile(mode='rt') as tf:
    #    t=tf.read()
        #tt=str(t)
    #    print(t)
    root = plistlib.load(temp)
    l1 = 1
    l2 = 0
    len_containers = (len(root["Containers"]))
    for l1 in range(1, len_containers):
        volumes_len = (len(root["Containers"][l1]["Volumes"]))
        for l2 in range(volumes_len):
            value = root["Containers"][l1]["Volumes"][l2]["Locked"]
            if value == True:
                id_val = root["Containers"][l1]["Volumes"][l2]["APFSVolumeUUID"]
                print(id_val)
"""
root = plistlib.load(pl)
    #root = plistlib.load(plist_path)
l1 = 1
l2 = 0

len_containers = (len(root["Containers"]))
for l1 in range(1,len_containers):
    volumes_len = (len(root["Containers"][l1]["Volumes"]))
    for l2 in range(volumes_len):
        value = root["Containers"][l1]["Volumes"][l2]["Locked"]
        if value == True:
            id_val = root["Containers"][l1]["Volumes"][l2]["APFSVolumeUUID"]
            print(id_val)
"""