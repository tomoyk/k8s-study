exit 0


$ k get pods -n sp2 -o wide
NAME                              READY     STATUS    RESTARTS   AGE       IP          NODE
sp2-deployment-659d5888fb-5p2tg   1/1       Running   0          3m        10.20.2.8   gke-guestbook-default-pool-c8709d0a-c1q0
sp2-deployment-659d5888fb-r24wt   1/1       Running   0          3m        10.20.0.6   gke-guestbook-default-pool-c8709d0a-1tdg


$ k get rs -n sp2
NAME                        DESIRED   CURRENT   READY     AGE
sp2-deployment-659d5888fb   2         2         2         2m


$ k describe sp2-deployment-659d5888fb-5p2tg -n sp2
Name:           sp2-deployment-659d5888fb-5p2tg
Namespace:      sp2
Node:           gke-guestbook-default-pool-c8709d0a-c1q0/10.140.0.2
Start Time:     Tue, 04 Dec 2018 12:35:54 +0900
Labels:         app=sample-app
                pod-template-hash=2158144496
Annotations:    <none>
Status:         Running
IP:             10.20.2.8
Controlled By:  ReplicaSet/sp2-deployment-659d5888fb
Containers:
  nginx-host-container:
    Container ID:   docker://72a8da756caa085307e674dce8ad897d751fa6fcff121c57b005f6e1312ad31a
    Image:          makocchi/docker-nginx-hostname
    Image ID:       docker-pullable://makocchi/docker-nginx-hostname@sha256:faea9bf4a1fbfbdd56dc337764bbc514aedea80b19348220287a1c579c391ebf
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Tue, 04 Dec 2018 12:36:02 +0900
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from default-token-lqnhq (ro)
Conditions:
  Type           Status
  Initialized    True 
  Ready          True 
  PodScheduled   True 
Volumes:
  default-token-lqnhq:
    Type:        Secret (a volume populated by a Secret)
    SecretName:  default-token-lqnhq
    Optional:    false
QoS Class:       BestEffort
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                 node.kubernetes.io/unreachable:NoExecute for 300s
Events:
  Type    Reason                 Age   From                                               Message
  ----    ------                 ----  ----                                               -------
  Normal  Scheduled              4m    default-scheduler                                  Successfully assigned sp2-deployment-659d5888fb-5p2tg to gke-guestbook-default-pool-c8709d0a-c1q0
  Normal  SuccessfulMountVolume  4m    kubelet, gke-guestbook-default-pool-c8709d0a-c1q0  MountVolume.SetUp succeeded for volume "default-token-lqnhq"
  Normal  Pulling                4m    kubelet, gke-guestbook-default-pool-c8709d0a-c1q0  pulling image "makocchi/docker-nginx-hostname"
  Normal  Pulled                 4m    kubelet, gke-guestbook-default-pool-c8709d0a-c1q0  Successfully pulled image "makocchi/docker-nginx-hostname"
  Normal  Created                4m    kubelet, gke-guestbook-default-pool-c8709d0a-c1q0  Created container
  Normal  Started                4m    kubelet, gke-guestbook-default-pool-c8709d0a-c1q0  Started container


###################### ###################### ###################### ###################### ######################

$ k get rs -n sp2
NAME                        DESIRED   CURRENT   READY     AGE
sp2-deployment-659d5888fb   2         2         2         2m


$ k scale rs sp2-deployment-659d5888fb --replicas 4 -n sp2
replicaset.extensions "sp2-deployment-659d5888fb" scaled


$ k get rs -n sp2
NAME                        DESIRED   CURRENT   READY     AGE
sp2-deployment-659d5888fb   4         4         4         24m

###################### ###################### ###################### ###################### ######################


