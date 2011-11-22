#!/usr/bin/ruby
#

EUI = ARGV[1]  # prefix
k = ARGV[0]    # mac
k.delete ':.'  # delete : and . from MAC, to allow IOS and 'standard' MAC format
k.scan /.{6}/  # divide MAC to two equal 6 character partitions
k.join 'fffe'  # join the partitions with string 'fffe'
k.scan /../    # divide the string to partitions of two chars
# convert first partition hex to
#  integer then xor it to flip 'local significance bit'
k[0] = "%02d" % k[0].hex ^ 0b10 
k.join         # join the 'mac' address partitions to single string
k.scan /..../  # divide the string to partitions of four
k.join ':'     # join the partitions of four with ':'
EUI + k        # add  the prefix to the suffix

