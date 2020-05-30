## How to access the cluster? using ssh & port! (default user onos password rocks)

```
ssh onos@127.0.0.1 -p 8101  
```
## Install ONOS applications

### Installing "Host Location Provider" Application

```
app activate org.onosproject.hostprovider
```
### Installing "Host Mobility" Application

```
app activate org.onosproject.mobility
```
### Installing "LLDP Link Provider" Application

```
app activate org.onosproject.lldpprovider
```
### Installing "OpenFlow Agent" Application

```
app activate org.onosproject.ofagent
```
### Installing "OpenFlow Base Provider" Application

```
app activate org.onosproject.openflow-base
```
### Installing "OpenFlow Provider Suite" Application

```
app activate org.onosproject.openflow
```
### Installing "Optical Application" Application

```
app activate org.onosproject.roadm
```
### Installing "Proxy ARP/NDP" Application
```
app activate org.onosproject.proxyarp 
```
