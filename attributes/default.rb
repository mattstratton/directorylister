#
# Cookbook Name:: directorylister
# Attributes:: default
#
# Copyright (C) 2014 Trueblue
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


default[:directorylister][:apppool_user] = "svc-WaSignal"
default[:directorylister][:apppool_password] = "Wa$ign@l"
default[:directorylister][:web_root] = "c:/webroot/"
default[:directorylister][:wcf_root] = "c:/wcfroot/directorylister/"
default[:directorylister][:log_root] = "c:/logs/"
default[:directorylister][:wcf_server] = "localhoster:19234"
default[:directorylister][:xmlpath] = "c:/directorylister/"
#TODO - factor out port to a separate attribute maybe