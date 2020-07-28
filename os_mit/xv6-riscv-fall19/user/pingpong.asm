
user/_pingpong:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/syscall.h"

void main(int argc, char* argv[]) {
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	1800                	addi	s0,sp,48
    int parent_fd[2],child_fd[2];
    pipe(parent_fd);
   8:	fe840513          	addi	a0,s0,-24
   c:	00000097          	auipc	ra,0x0
  10:	2b4080e7          	jalr	692(ra) # 2c0 <pipe>
    pipe(child_fd);
  14:	fe040513          	addi	a0,s0,-32
  18:	00000097          	auipc	ra,0x0
  1c:	2a8080e7          	jalr	680(ra) # 2c0 <pipe>
    if(fork() == 0) {//child
  20:	00000097          	auipc	ra,0x0
  24:	288080e7          	jalr	648(ra) # 2a8 <fork>
  28:	e539                	bnez	a0,76 <main+0x76>
        char buf[10];
        read(parent_fd[0],buf,sizeof buf);
  2a:	4629                	li	a2,10
  2c:	fd040593          	addi	a1,s0,-48
  30:	fe842503          	lw	a0,-24(s0)
  34:	00000097          	auipc	ra,0x0
  38:	294080e7          	jalr	660(ra) # 2c8 <read>
        fprintf(1,"%d : recieved ping\n",getpid());
  3c:	00000097          	auipc	ra,0x0
  40:	2f4080e7          	jalr	756(ra) # 330 <getpid>
  44:	862a                	mv	a2,a0
  46:	00000597          	auipc	a1,0x0
  4a:	7aa58593          	addi	a1,a1,1962 # 7f0 <malloc+0xea>
  4e:	4505                	li	a0,1
  50:	00000097          	auipc	ra,0x0
  54:	5ca080e7          	jalr	1482(ra) # 61a <fprintf>
        write(child_fd[1],"pong\n",5);
  58:	4615                	li	a2,5
  5a:	00000597          	auipc	a1,0x0
  5e:	7ae58593          	addi	a1,a1,1966 # 808 <malloc+0x102>
  62:	fe442503          	lw	a0,-28(s0)
  66:	00000097          	auipc	ra,0x0
  6a:	26a080e7          	jalr	618(ra) # 2d0 <write>
        exit();
  6e:	00000097          	auipc	ra,0x0
  72:	242080e7          	jalr	578(ra) # 2b0 <exit>
    }
    else{
        char buf_[10];
        write(parent_fd[1],"ping\n",5);
  76:	4615                	li	a2,5
  78:	00000597          	auipc	a1,0x0
  7c:	79858593          	addi	a1,a1,1944 # 810 <malloc+0x10a>
  80:	fec42503          	lw	a0,-20(s0)
  84:	00000097          	auipc	ra,0x0
  88:	24c080e7          	jalr	588(ra) # 2d0 <write>
        read(child_fd[0],buf_,sizeof buf_);
  8c:	4629                	li	a2,10
  8e:	fd040593          	addi	a1,s0,-48
  92:	fe042503          	lw	a0,-32(s0)
  96:	00000097          	auipc	ra,0x0
  9a:	232080e7          	jalr	562(ra) # 2c8 <read>
        fprintf(1,"%d : recieved pong\n",getpid());
  9e:	00000097          	auipc	ra,0x0
  a2:	292080e7          	jalr	658(ra) # 330 <getpid>
  a6:	862a                	mv	a2,a0
  a8:	00000597          	auipc	a1,0x0
  ac:	77058593          	addi	a1,a1,1904 # 818 <malloc+0x112>
  b0:	4505                	li	a0,1
  b2:	00000097          	auipc	ra,0x0
  b6:	568080e7          	jalr	1384(ra) # 61a <fprintf>
        exit();
  ba:	00000097          	auipc	ra,0x0
  be:	1f6080e7          	jalr	502(ra) # 2b0 <exit>

00000000000000c2 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  c2:	1141                	addi	sp,sp,-16
  c4:	e422                	sd	s0,8(sp)
  c6:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c8:	87aa                	mv	a5,a0
  ca:	0585                	addi	a1,a1,1
  cc:	0785                	addi	a5,a5,1
  ce:	fff5c703          	lbu	a4,-1(a1)
  d2:	fee78fa3          	sb	a4,-1(a5)
  d6:	fb75                	bnez	a4,ca <strcpy+0x8>
    ;
  return os;
}
  d8:	6422                	ld	s0,8(sp)
  da:	0141                	addi	sp,sp,16
  dc:	8082                	ret

00000000000000de <strcmp>:

int
strcmp(const char *p, const char *q)
{
  de:	1141                	addi	sp,sp,-16
  e0:	e422                	sd	s0,8(sp)
  e2:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  e4:	00054783          	lbu	a5,0(a0)
  e8:	cb91                	beqz	a5,fc <strcmp+0x1e>
  ea:	0005c703          	lbu	a4,0(a1)
  ee:	00f71763          	bne	a4,a5,fc <strcmp+0x1e>
    p++, q++;
  f2:	0505                	addi	a0,a0,1
  f4:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  f6:	00054783          	lbu	a5,0(a0)
  fa:	fbe5                	bnez	a5,ea <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  fc:	0005c503          	lbu	a0,0(a1)
}
 100:	40a7853b          	subw	a0,a5,a0
 104:	6422                	ld	s0,8(sp)
 106:	0141                	addi	sp,sp,16
 108:	8082                	ret

000000000000010a <strlen>:

uint
strlen(const char *s)
{
 10a:	1141                	addi	sp,sp,-16
 10c:	e422                	sd	s0,8(sp)
 10e:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 110:	00054783          	lbu	a5,0(a0)
 114:	cf91                	beqz	a5,130 <strlen+0x26>
 116:	0505                	addi	a0,a0,1
 118:	87aa                	mv	a5,a0
 11a:	4685                	li	a3,1
 11c:	9e89                	subw	a3,a3,a0
 11e:	00f6853b          	addw	a0,a3,a5
 122:	0785                	addi	a5,a5,1
 124:	fff7c703          	lbu	a4,-1(a5)
 128:	fb7d                	bnez	a4,11e <strlen+0x14>
    ;
  return n;
}
 12a:	6422                	ld	s0,8(sp)
 12c:	0141                	addi	sp,sp,16
 12e:	8082                	ret
  for(n = 0; s[n]; n++)
 130:	4501                	li	a0,0
 132:	bfe5                	j	12a <strlen+0x20>

0000000000000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	1141                	addi	sp,sp,-16
 136:	e422                	sd	s0,8(sp)
 138:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 13a:	ca19                	beqz	a2,150 <memset+0x1c>
 13c:	87aa                	mv	a5,a0
 13e:	1602                	slli	a2,a2,0x20
 140:	9201                	srli	a2,a2,0x20
 142:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 146:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 14a:	0785                	addi	a5,a5,1
 14c:	fee79de3          	bne	a5,a4,146 <memset+0x12>
  }
  return dst;
}
 150:	6422                	ld	s0,8(sp)
 152:	0141                	addi	sp,sp,16
 154:	8082                	ret

0000000000000156 <strchr>:

char*
strchr(const char *s, char c)
{
 156:	1141                	addi	sp,sp,-16
 158:	e422                	sd	s0,8(sp)
 15a:	0800                	addi	s0,sp,16
  for(; *s; s++)
 15c:	00054783          	lbu	a5,0(a0)
 160:	cb99                	beqz	a5,176 <strchr+0x20>
    if(*s == c)
 162:	00f58763          	beq	a1,a5,170 <strchr+0x1a>
  for(; *s; s++)
 166:	0505                	addi	a0,a0,1
 168:	00054783          	lbu	a5,0(a0)
 16c:	fbfd                	bnez	a5,162 <strchr+0xc>
      return (char*)s;
  return 0;
 16e:	4501                	li	a0,0
}
 170:	6422                	ld	s0,8(sp)
 172:	0141                	addi	sp,sp,16
 174:	8082                	ret
  return 0;
 176:	4501                	li	a0,0
 178:	bfe5                	j	170 <strchr+0x1a>

000000000000017a <gets>:

char*
gets(char *buf, int max)
{
 17a:	711d                	addi	sp,sp,-96
 17c:	ec86                	sd	ra,88(sp)
 17e:	e8a2                	sd	s0,80(sp)
 180:	e4a6                	sd	s1,72(sp)
 182:	e0ca                	sd	s2,64(sp)
 184:	fc4e                	sd	s3,56(sp)
 186:	f852                	sd	s4,48(sp)
 188:	f456                	sd	s5,40(sp)
 18a:	f05a                	sd	s6,32(sp)
 18c:	ec5e                	sd	s7,24(sp)
 18e:	1080                	addi	s0,sp,96
 190:	8baa                	mv	s7,a0
 192:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 194:	892a                	mv	s2,a0
 196:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 198:	4aa9                	li	s5,10
 19a:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 19c:	89a6                	mv	s3,s1
 19e:	2485                	addiw	s1,s1,1
 1a0:	0344d863          	bge	s1,s4,1d0 <gets+0x56>
    cc = read(0, &c, 1);
 1a4:	4605                	li	a2,1
 1a6:	faf40593          	addi	a1,s0,-81
 1aa:	4501                	li	a0,0
 1ac:	00000097          	auipc	ra,0x0
 1b0:	11c080e7          	jalr	284(ra) # 2c8 <read>
    if(cc < 1)
 1b4:	00a05e63          	blez	a0,1d0 <gets+0x56>
    buf[i++] = c;
 1b8:	faf44783          	lbu	a5,-81(s0)
 1bc:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 1c0:	01578763          	beq	a5,s5,1ce <gets+0x54>
 1c4:	0905                	addi	s2,s2,1
 1c6:	fd679be3          	bne	a5,s6,19c <gets+0x22>
  for(i=0; i+1 < max; ){
 1ca:	89a6                	mv	s3,s1
 1cc:	a011                	j	1d0 <gets+0x56>
 1ce:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 1d0:	99de                	add	s3,s3,s7
 1d2:	00098023          	sb	zero,0(s3)
  return buf;
}
 1d6:	855e                	mv	a0,s7
 1d8:	60e6                	ld	ra,88(sp)
 1da:	6446                	ld	s0,80(sp)
 1dc:	64a6                	ld	s1,72(sp)
 1de:	6906                	ld	s2,64(sp)
 1e0:	79e2                	ld	s3,56(sp)
 1e2:	7a42                	ld	s4,48(sp)
 1e4:	7aa2                	ld	s5,40(sp)
 1e6:	7b02                	ld	s6,32(sp)
 1e8:	6be2                	ld	s7,24(sp)
 1ea:	6125                	addi	sp,sp,96
 1ec:	8082                	ret

00000000000001ee <stat>:

int
stat(const char *n, struct stat *st)
{
 1ee:	1101                	addi	sp,sp,-32
 1f0:	ec06                	sd	ra,24(sp)
 1f2:	e822                	sd	s0,16(sp)
 1f4:	e426                	sd	s1,8(sp)
 1f6:	e04a                	sd	s2,0(sp)
 1f8:	1000                	addi	s0,sp,32
 1fa:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fc:	4581                	li	a1,0
 1fe:	00000097          	auipc	ra,0x0
 202:	0f2080e7          	jalr	242(ra) # 2f0 <open>
  if(fd < 0)
 206:	02054563          	bltz	a0,230 <stat+0x42>
 20a:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 20c:	85ca                	mv	a1,s2
 20e:	00000097          	auipc	ra,0x0
 212:	0fa080e7          	jalr	250(ra) # 308 <fstat>
 216:	892a                	mv	s2,a0
  close(fd);
 218:	8526                	mv	a0,s1
 21a:	00000097          	auipc	ra,0x0
 21e:	0be080e7          	jalr	190(ra) # 2d8 <close>
  return r;
}
 222:	854a                	mv	a0,s2
 224:	60e2                	ld	ra,24(sp)
 226:	6442                	ld	s0,16(sp)
 228:	64a2                	ld	s1,8(sp)
 22a:	6902                	ld	s2,0(sp)
 22c:	6105                	addi	sp,sp,32
 22e:	8082                	ret
    return -1;
 230:	597d                	li	s2,-1
 232:	bfc5                	j	222 <stat+0x34>

0000000000000234 <atoi>:

int
atoi(const char *s)
{
 234:	1141                	addi	sp,sp,-16
 236:	e422                	sd	s0,8(sp)
 238:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23a:	00054603          	lbu	a2,0(a0)
 23e:	fd06079b          	addiw	a5,a2,-48
 242:	0ff7f793          	andi	a5,a5,255
 246:	4725                	li	a4,9
 248:	02f76963          	bltu	a4,a5,27a <atoi+0x46>
 24c:	86aa                	mv	a3,a0
  n = 0;
 24e:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 250:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 252:	0685                	addi	a3,a3,1
 254:	0025179b          	slliw	a5,a0,0x2
 258:	9fa9                	addw	a5,a5,a0
 25a:	0017979b          	slliw	a5,a5,0x1
 25e:	9fb1                	addw	a5,a5,a2
 260:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 264:	0006c603          	lbu	a2,0(a3)
 268:	fd06071b          	addiw	a4,a2,-48
 26c:	0ff77713          	andi	a4,a4,255
 270:	fee5f1e3          	bgeu	a1,a4,252 <atoi+0x1e>
  return n;
}
 274:	6422                	ld	s0,8(sp)
 276:	0141                	addi	sp,sp,16
 278:	8082                	ret
  n = 0;
 27a:	4501                	li	a0,0
 27c:	bfe5                	j	274 <atoi+0x40>

000000000000027e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 27e:	1141                	addi	sp,sp,-16
 280:	e422                	sd	s0,8(sp)
 282:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 284:	00c05f63          	blez	a2,2a2 <memmove+0x24>
 288:	1602                	slli	a2,a2,0x20
 28a:	9201                	srli	a2,a2,0x20
 28c:	00c506b3          	add	a3,a0,a2
  dst = vdst;
 290:	87aa                	mv	a5,a0
    *dst++ = *src++;
 292:	0585                	addi	a1,a1,1
 294:	0785                	addi	a5,a5,1
 296:	fff5c703          	lbu	a4,-1(a1)
 29a:	fee78fa3          	sb	a4,-1(a5)
  while(n-- > 0)
 29e:	fed79ae3          	bne	a5,a3,292 <memmove+0x14>
  return vdst;
}
 2a2:	6422                	ld	s0,8(sp)
 2a4:	0141                	addi	sp,sp,16
 2a6:	8082                	ret

00000000000002a8 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 2a8:	4885                	li	a7,1
 ecall
 2aa:	00000073          	ecall
 ret
 2ae:	8082                	ret

00000000000002b0 <exit>:
.global exit
exit:
 li a7, SYS_exit
 2b0:	4889                	li	a7,2
 ecall
 2b2:	00000073          	ecall
 ret
 2b6:	8082                	ret

00000000000002b8 <wait>:
.global wait
wait:
 li a7, SYS_wait
 2b8:	488d                	li	a7,3
 ecall
 2ba:	00000073          	ecall
 ret
 2be:	8082                	ret

00000000000002c0 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 2c0:	4891                	li	a7,4
 ecall
 2c2:	00000073          	ecall
 ret
 2c6:	8082                	ret

00000000000002c8 <read>:
.global read
read:
 li a7, SYS_read
 2c8:	4895                	li	a7,5
 ecall
 2ca:	00000073          	ecall
 ret
 2ce:	8082                	ret

00000000000002d0 <write>:
.global write
write:
 li a7, SYS_write
 2d0:	48c1                	li	a7,16
 ecall
 2d2:	00000073          	ecall
 ret
 2d6:	8082                	ret

00000000000002d8 <close>:
.global close
close:
 li a7, SYS_close
 2d8:	48d5                	li	a7,21
 ecall
 2da:	00000073          	ecall
 ret
 2de:	8082                	ret

00000000000002e0 <kill>:
.global kill
kill:
 li a7, SYS_kill
 2e0:	4899                	li	a7,6
 ecall
 2e2:	00000073          	ecall
 ret
 2e6:	8082                	ret

00000000000002e8 <exec>:
.global exec
exec:
 li a7, SYS_exec
 2e8:	489d                	li	a7,7
 ecall
 2ea:	00000073          	ecall
 ret
 2ee:	8082                	ret

00000000000002f0 <open>:
.global open
open:
 li a7, SYS_open
 2f0:	48bd                	li	a7,15
 ecall
 2f2:	00000073          	ecall
 ret
 2f6:	8082                	ret

00000000000002f8 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 2f8:	48c5                	li	a7,17
 ecall
 2fa:	00000073          	ecall
 ret
 2fe:	8082                	ret

0000000000000300 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 300:	48c9                	li	a7,18
 ecall
 302:	00000073          	ecall
 ret
 306:	8082                	ret

0000000000000308 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 308:	48a1                	li	a7,8
 ecall
 30a:	00000073          	ecall
 ret
 30e:	8082                	ret

0000000000000310 <link>:
.global link
link:
 li a7, SYS_link
 310:	48cd                	li	a7,19
 ecall
 312:	00000073          	ecall
 ret
 316:	8082                	ret

0000000000000318 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 318:	48d1                	li	a7,20
 ecall
 31a:	00000073          	ecall
 ret
 31e:	8082                	ret

0000000000000320 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 320:	48a5                	li	a7,9
 ecall
 322:	00000073          	ecall
 ret
 326:	8082                	ret

0000000000000328 <dup>:
.global dup
dup:
 li a7, SYS_dup
 328:	48a9                	li	a7,10
 ecall
 32a:	00000073          	ecall
 ret
 32e:	8082                	ret

0000000000000330 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 330:	48ad                	li	a7,11
 ecall
 332:	00000073          	ecall
 ret
 336:	8082                	ret

0000000000000338 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 338:	48b1                	li	a7,12
 ecall
 33a:	00000073          	ecall
 ret
 33e:	8082                	ret

0000000000000340 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 340:	48b5                	li	a7,13
 ecall
 342:	00000073          	ecall
 ret
 346:	8082                	ret

0000000000000348 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 348:	48b9                	li	a7,14
 ecall
 34a:	00000073          	ecall
 ret
 34e:	8082                	ret

0000000000000350 <ntas>:
.global ntas
ntas:
 li a7, SYS_ntas
 350:	48d9                	li	a7,22
 ecall
 352:	00000073          	ecall
 ret
 356:	8082                	ret

0000000000000358 <crash>:
.global crash
crash:
 li a7, SYS_crash
 358:	48dd                	li	a7,23
 ecall
 35a:	00000073          	ecall
 ret
 35e:	8082                	ret

0000000000000360 <mount>:
.global mount
mount:
 li a7, SYS_mount
 360:	48e1                	li	a7,24
 ecall
 362:	00000073          	ecall
 ret
 366:	8082                	ret

0000000000000368 <umount>:
.global umount
umount:
 li a7, SYS_umount
 368:	48e5                	li	a7,25
 ecall
 36a:	00000073          	ecall
 ret
 36e:	8082                	ret

0000000000000370 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 370:	1101                	addi	sp,sp,-32
 372:	ec06                	sd	ra,24(sp)
 374:	e822                	sd	s0,16(sp)
 376:	1000                	addi	s0,sp,32
 378:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 37c:	4605                	li	a2,1
 37e:	fef40593          	addi	a1,s0,-17
 382:	00000097          	auipc	ra,0x0
 386:	f4e080e7          	jalr	-178(ra) # 2d0 <write>
}
 38a:	60e2                	ld	ra,24(sp)
 38c:	6442                	ld	s0,16(sp)
 38e:	6105                	addi	sp,sp,32
 390:	8082                	ret

0000000000000392 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 392:	7139                	addi	sp,sp,-64
 394:	fc06                	sd	ra,56(sp)
 396:	f822                	sd	s0,48(sp)
 398:	f426                	sd	s1,40(sp)
 39a:	f04a                	sd	s2,32(sp)
 39c:	ec4e                	sd	s3,24(sp)
 39e:	0080                	addi	s0,sp,64
 3a0:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3a2:	c299                	beqz	a3,3a8 <printint+0x16>
 3a4:	0805c863          	bltz	a1,434 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3a8:	2581                	sext.w	a1,a1
  neg = 0;
 3aa:	4881                	li	a7,0
 3ac:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 3b0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 3b2:	2601                	sext.w	a2,a2
 3b4:	00000517          	auipc	a0,0x0
 3b8:	48450513          	addi	a0,a0,1156 # 838 <digits>
 3bc:	883a                	mv	a6,a4
 3be:	2705                	addiw	a4,a4,1
 3c0:	02c5f7bb          	remuw	a5,a1,a2
 3c4:	1782                	slli	a5,a5,0x20
 3c6:	9381                	srli	a5,a5,0x20
 3c8:	97aa                	add	a5,a5,a0
 3ca:	0007c783          	lbu	a5,0(a5)
 3ce:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 3d2:	0005879b          	sext.w	a5,a1
 3d6:	02c5d5bb          	divuw	a1,a1,a2
 3da:	0685                	addi	a3,a3,1
 3dc:	fec7f0e3          	bgeu	a5,a2,3bc <printint+0x2a>
  if(neg)
 3e0:	00088b63          	beqz	a7,3f6 <printint+0x64>
    buf[i++] = '-';
 3e4:	fd040793          	addi	a5,s0,-48
 3e8:	973e                	add	a4,a4,a5
 3ea:	02d00793          	li	a5,45
 3ee:	fef70823          	sb	a5,-16(a4)
 3f2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 3f6:	02e05863          	blez	a4,426 <printint+0x94>
 3fa:	fc040793          	addi	a5,s0,-64
 3fe:	00e78933          	add	s2,a5,a4
 402:	fff78993          	addi	s3,a5,-1
 406:	99ba                	add	s3,s3,a4
 408:	377d                	addiw	a4,a4,-1
 40a:	1702                	slli	a4,a4,0x20
 40c:	9301                	srli	a4,a4,0x20
 40e:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 412:	fff94583          	lbu	a1,-1(s2)
 416:	8526                	mv	a0,s1
 418:	00000097          	auipc	ra,0x0
 41c:	f58080e7          	jalr	-168(ra) # 370 <putc>
  while(--i >= 0)
 420:	197d                	addi	s2,s2,-1
 422:	ff3918e3          	bne	s2,s3,412 <printint+0x80>
}
 426:	70e2                	ld	ra,56(sp)
 428:	7442                	ld	s0,48(sp)
 42a:	74a2                	ld	s1,40(sp)
 42c:	7902                	ld	s2,32(sp)
 42e:	69e2                	ld	s3,24(sp)
 430:	6121                	addi	sp,sp,64
 432:	8082                	ret
    x = -xx;
 434:	40b005bb          	negw	a1,a1
    neg = 1;
 438:	4885                	li	a7,1
    x = -xx;
 43a:	bf8d                	j	3ac <printint+0x1a>

000000000000043c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 43c:	7119                	addi	sp,sp,-128
 43e:	fc86                	sd	ra,120(sp)
 440:	f8a2                	sd	s0,112(sp)
 442:	f4a6                	sd	s1,104(sp)
 444:	f0ca                	sd	s2,96(sp)
 446:	ecce                	sd	s3,88(sp)
 448:	e8d2                	sd	s4,80(sp)
 44a:	e4d6                	sd	s5,72(sp)
 44c:	e0da                	sd	s6,64(sp)
 44e:	fc5e                	sd	s7,56(sp)
 450:	f862                	sd	s8,48(sp)
 452:	f466                	sd	s9,40(sp)
 454:	f06a                	sd	s10,32(sp)
 456:	ec6e                	sd	s11,24(sp)
 458:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 45a:	0005c903          	lbu	s2,0(a1)
 45e:	18090f63          	beqz	s2,5fc <vprintf+0x1c0>
 462:	8aaa                	mv	s5,a0
 464:	8b32                	mv	s6,a2
 466:	00158493          	addi	s1,a1,1
  state = 0;
 46a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 46c:	02500a13          	li	s4,37
      if(c == 'd'){
 470:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 474:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 478:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 47c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 480:	00000b97          	auipc	s7,0x0
 484:	3b8b8b93          	addi	s7,s7,952 # 838 <digits>
 488:	a839                	j	4a6 <vprintf+0x6a>
        putc(fd, c);
 48a:	85ca                	mv	a1,s2
 48c:	8556                	mv	a0,s5
 48e:	00000097          	auipc	ra,0x0
 492:	ee2080e7          	jalr	-286(ra) # 370 <putc>
 496:	a019                	j	49c <vprintf+0x60>
    } else if(state == '%'){
 498:	01498f63          	beq	s3,s4,4b6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 49c:	0485                	addi	s1,s1,1
 49e:	fff4c903          	lbu	s2,-1(s1)
 4a2:	14090d63          	beqz	s2,5fc <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 4a6:	0009079b          	sext.w	a5,s2
    if(state == 0){
 4aa:	fe0997e3          	bnez	s3,498 <vprintf+0x5c>
      if(c == '%'){
 4ae:	fd479ee3          	bne	a5,s4,48a <vprintf+0x4e>
        state = '%';
 4b2:	89be                	mv	s3,a5
 4b4:	b7e5                	j	49c <vprintf+0x60>
      if(c == 'd'){
 4b6:	05878063          	beq	a5,s8,4f6 <vprintf+0xba>
      } else if(c == 'l') {
 4ba:	05978c63          	beq	a5,s9,512 <vprintf+0xd6>
      } else if(c == 'x') {
 4be:	07a78863          	beq	a5,s10,52e <vprintf+0xf2>
      } else if(c == 'p') {
 4c2:	09b78463          	beq	a5,s11,54a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 4c6:	07300713          	li	a4,115
 4ca:	0ce78663          	beq	a5,a4,596 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ce:	06300713          	li	a4,99
 4d2:	0ee78e63          	beq	a5,a4,5ce <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 4d6:	11478863          	beq	a5,s4,5e6 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 4da:	85d2                	mv	a1,s4
 4dc:	8556                	mv	a0,s5
 4de:	00000097          	auipc	ra,0x0
 4e2:	e92080e7          	jalr	-366(ra) # 370 <putc>
        putc(fd, c);
 4e6:	85ca                	mv	a1,s2
 4e8:	8556                	mv	a0,s5
 4ea:	00000097          	auipc	ra,0x0
 4ee:	e86080e7          	jalr	-378(ra) # 370 <putc>
      }
      state = 0;
 4f2:	4981                	li	s3,0
 4f4:	b765                	j	49c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 4f6:	008b0913          	addi	s2,s6,8
 4fa:	4685                	li	a3,1
 4fc:	4629                	li	a2,10
 4fe:	000b2583          	lw	a1,0(s6)
 502:	8556                	mv	a0,s5
 504:	00000097          	auipc	ra,0x0
 508:	e8e080e7          	jalr	-370(ra) # 392 <printint>
 50c:	8b4a                	mv	s6,s2
      state = 0;
 50e:	4981                	li	s3,0
 510:	b771                	j	49c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 512:	008b0913          	addi	s2,s6,8
 516:	4681                	li	a3,0
 518:	4629                	li	a2,10
 51a:	000b2583          	lw	a1,0(s6)
 51e:	8556                	mv	a0,s5
 520:	00000097          	auipc	ra,0x0
 524:	e72080e7          	jalr	-398(ra) # 392 <printint>
 528:	8b4a                	mv	s6,s2
      state = 0;
 52a:	4981                	li	s3,0
 52c:	bf85                	j	49c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 52e:	008b0913          	addi	s2,s6,8
 532:	4681                	li	a3,0
 534:	4641                	li	a2,16
 536:	000b2583          	lw	a1,0(s6)
 53a:	8556                	mv	a0,s5
 53c:	00000097          	auipc	ra,0x0
 540:	e56080e7          	jalr	-426(ra) # 392 <printint>
 544:	8b4a                	mv	s6,s2
      state = 0;
 546:	4981                	li	s3,0
 548:	bf91                	j	49c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 54a:	008b0793          	addi	a5,s6,8
 54e:	f8f43423          	sd	a5,-120(s0)
 552:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 556:	03000593          	li	a1,48
 55a:	8556                	mv	a0,s5
 55c:	00000097          	auipc	ra,0x0
 560:	e14080e7          	jalr	-492(ra) # 370 <putc>
  putc(fd, 'x');
 564:	85ea                	mv	a1,s10
 566:	8556                	mv	a0,s5
 568:	00000097          	auipc	ra,0x0
 56c:	e08080e7          	jalr	-504(ra) # 370 <putc>
 570:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 572:	03c9d793          	srli	a5,s3,0x3c
 576:	97de                	add	a5,a5,s7
 578:	0007c583          	lbu	a1,0(a5)
 57c:	8556                	mv	a0,s5
 57e:	00000097          	auipc	ra,0x0
 582:	df2080e7          	jalr	-526(ra) # 370 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 586:	0992                	slli	s3,s3,0x4
 588:	397d                	addiw	s2,s2,-1
 58a:	fe0914e3          	bnez	s2,572 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 58e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 592:	4981                	li	s3,0
 594:	b721                	j	49c <vprintf+0x60>
        s = va_arg(ap, char*);
 596:	008b0993          	addi	s3,s6,8
 59a:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 59e:	02090163          	beqz	s2,5c0 <vprintf+0x184>
        while(*s != 0){
 5a2:	00094583          	lbu	a1,0(s2)
 5a6:	c9a1                	beqz	a1,5f6 <vprintf+0x1ba>
          putc(fd, *s);
 5a8:	8556                	mv	a0,s5
 5aa:	00000097          	auipc	ra,0x0
 5ae:	dc6080e7          	jalr	-570(ra) # 370 <putc>
          s++;
 5b2:	0905                	addi	s2,s2,1
        while(*s != 0){
 5b4:	00094583          	lbu	a1,0(s2)
 5b8:	f9e5                	bnez	a1,5a8 <vprintf+0x16c>
        s = va_arg(ap, char*);
 5ba:	8b4e                	mv	s6,s3
      state = 0;
 5bc:	4981                	li	s3,0
 5be:	bdf9                	j	49c <vprintf+0x60>
          s = "(null)";
 5c0:	00000917          	auipc	s2,0x0
 5c4:	27090913          	addi	s2,s2,624 # 830 <malloc+0x12a>
        while(*s != 0){
 5c8:	02800593          	li	a1,40
 5cc:	bff1                	j	5a8 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 5ce:	008b0913          	addi	s2,s6,8
 5d2:	000b4583          	lbu	a1,0(s6)
 5d6:	8556                	mv	a0,s5
 5d8:	00000097          	auipc	ra,0x0
 5dc:	d98080e7          	jalr	-616(ra) # 370 <putc>
 5e0:	8b4a                	mv	s6,s2
      state = 0;
 5e2:	4981                	li	s3,0
 5e4:	bd65                	j	49c <vprintf+0x60>
        putc(fd, c);
 5e6:	85d2                	mv	a1,s4
 5e8:	8556                	mv	a0,s5
 5ea:	00000097          	auipc	ra,0x0
 5ee:	d86080e7          	jalr	-634(ra) # 370 <putc>
      state = 0;
 5f2:	4981                	li	s3,0
 5f4:	b565                	j	49c <vprintf+0x60>
        s = va_arg(ap, char*);
 5f6:	8b4e                	mv	s6,s3
      state = 0;
 5f8:	4981                	li	s3,0
 5fa:	b54d                	j	49c <vprintf+0x60>
    }
  }
}
 5fc:	70e6                	ld	ra,120(sp)
 5fe:	7446                	ld	s0,112(sp)
 600:	74a6                	ld	s1,104(sp)
 602:	7906                	ld	s2,96(sp)
 604:	69e6                	ld	s3,88(sp)
 606:	6a46                	ld	s4,80(sp)
 608:	6aa6                	ld	s5,72(sp)
 60a:	6b06                	ld	s6,64(sp)
 60c:	7be2                	ld	s7,56(sp)
 60e:	7c42                	ld	s8,48(sp)
 610:	7ca2                	ld	s9,40(sp)
 612:	7d02                	ld	s10,32(sp)
 614:	6de2                	ld	s11,24(sp)
 616:	6109                	addi	sp,sp,128
 618:	8082                	ret

000000000000061a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 61a:	715d                	addi	sp,sp,-80
 61c:	ec06                	sd	ra,24(sp)
 61e:	e822                	sd	s0,16(sp)
 620:	1000                	addi	s0,sp,32
 622:	e010                	sd	a2,0(s0)
 624:	e414                	sd	a3,8(s0)
 626:	e818                	sd	a4,16(s0)
 628:	ec1c                	sd	a5,24(s0)
 62a:	03043023          	sd	a6,32(s0)
 62e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 632:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 636:	8622                	mv	a2,s0
 638:	00000097          	auipc	ra,0x0
 63c:	e04080e7          	jalr	-508(ra) # 43c <vprintf>
}
 640:	60e2                	ld	ra,24(sp)
 642:	6442                	ld	s0,16(sp)
 644:	6161                	addi	sp,sp,80
 646:	8082                	ret

0000000000000648 <printf>:

void
printf(const char *fmt, ...)
{
 648:	711d                	addi	sp,sp,-96
 64a:	ec06                	sd	ra,24(sp)
 64c:	e822                	sd	s0,16(sp)
 64e:	1000                	addi	s0,sp,32
 650:	e40c                	sd	a1,8(s0)
 652:	e810                	sd	a2,16(s0)
 654:	ec14                	sd	a3,24(s0)
 656:	f018                	sd	a4,32(s0)
 658:	f41c                	sd	a5,40(s0)
 65a:	03043823          	sd	a6,48(s0)
 65e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 662:	00840613          	addi	a2,s0,8
 666:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 66a:	85aa                	mv	a1,a0
 66c:	4505                	li	a0,1
 66e:	00000097          	auipc	ra,0x0
 672:	dce080e7          	jalr	-562(ra) # 43c <vprintf>
}
 676:	60e2                	ld	ra,24(sp)
 678:	6442                	ld	s0,16(sp)
 67a:	6125                	addi	sp,sp,96
 67c:	8082                	ret

000000000000067e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 67e:	1141                	addi	sp,sp,-16
 680:	e422                	sd	s0,8(sp)
 682:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 684:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 688:	00000797          	auipc	a5,0x0
 68c:	1c87b783          	ld	a5,456(a5) # 850 <freep>
 690:	a805                	j	6c0 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 692:	4618                	lw	a4,8(a2)
 694:	9db9                	addw	a1,a1,a4
 696:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 69a:	6398                	ld	a4,0(a5)
 69c:	6318                	ld	a4,0(a4)
 69e:	fee53823          	sd	a4,-16(a0)
 6a2:	a091                	j	6e6 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 6a4:	ff852703          	lw	a4,-8(a0)
 6a8:	9e39                	addw	a2,a2,a4
 6aa:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 6ac:	ff053703          	ld	a4,-16(a0)
 6b0:	e398                	sd	a4,0(a5)
 6b2:	a099                	j	6f8 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b4:	6398                	ld	a4,0(a5)
 6b6:	00e7e463          	bltu	a5,a4,6be <free+0x40>
 6ba:	00e6ea63          	bltu	a3,a4,6ce <free+0x50>
{
 6be:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c0:	fed7fae3          	bgeu	a5,a3,6b4 <free+0x36>
 6c4:	6398                	ld	a4,0(a5)
 6c6:	00e6e463          	bltu	a3,a4,6ce <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ca:	fee7eae3          	bltu	a5,a4,6be <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 6ce:	ff852583          	lw	a1,-8(a0)
 6d2:	6390                	ld	a2,0(a5)
 6d4:	02059813          	slli	a6,a1,0x20
 6d8:	01c85713          	srli	a4,a6,0x1c
 6dc:	9736                	add	a4,a4,a3
 6de:	fae60ae3          	beq	a2,a4,692 <free+0x14>
    bp->s.ptr = p->s.ptr;
 6e2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 6e6:	4790                	lw	a2,8(a5)
 6e8:	02061593          	slli	a1,a2,0x20
 6ec:	01c5d713          	srli	a4,a1,0x1c
 6f0:	973e                	add	a4,a4,a5
 6f2:	fae689e3          	beq	a3,a4,6a4 <free+0x26>
  } else
    p->s.ptr = bp;
 6f6:	e394                	sd	a3,0(a5)
  freep = p;
 6f8:	00000717          	auipc	a4,0x0
 6fc:	14f73c23          	sd	a5,344(a4) # 850 <freep>
}
 700:	6422                	ld	s0,8(sp)
 702:	0141                	addi	sp,sp,16
 704:	8082                	ret

0000000000000706 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 706:	7139                	addi	sp,sp,-64
 708:	fc06                	sd	ra,56(sp)
 70a:	f822                	sd	s0,48(sp)
 70c:	f426                	sd	s1,40(sp)
 70e:	f04a                	sd	s2,32(sp)
 710:	ec4e                	sd	s3,24(sp)
 712:	e852                	sd	s4,16(sp)
 714:	e456                	sd	s5,8(sp)
 716:	e05a                	sd	s6,0(sp)
 718:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 71a:	02051493          	slli	s1,a0,0x20
 71e:	9081                	srli	s1,s1,0x20
 720:	04bd                	addi	s1,s1,15
 722:	8091                	srli	s1,s1,0x4
 724:	0014899b          	addiw	s3,s1,1
 728:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 72a:	00000517          	auipc	a0,0x0
 72e:	12653503          	ld	a0,294(a0) # 850 <freep>
 732:	c515                	beqz	a0,75e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 734:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 736:	4798                	lw	a4,8(a5)
 738:	02977f63          	bgeu	a4,s1,776 <malloc+0x70>
 73c:	8a4e                	mv	s4,s3
 73e:	0009871b          	sext.w	a4,s3
 742:	6685                	lui	a3,0x1
 744:	00d77363          	bgeu	a4,a3,74a <malloc+0x44>
 748:	6a05                	lui	s4,0x1
 74a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 74e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 752:	00000917          	auipc	s2,0x0
 756:	0fe90913          	addi	s2,s2,254 # 850 <freep>
  if(p == (char*)-1)
 75a:	5afd                	li	s5,-1
 75c:	a895                	j	7d0 <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 75e:	00000797          	auipc	a5,0x0
 762:	0fa78793          	addi	a5,a5,250 # 858 <base>
 766:	00000717          	auipc	a4,0x0
 76a:	0ef73523          	sd	a5,234(a4) # 850 <freep>
 76e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 770:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 774:	b7e1                	j	73c <malloc+0x36>
      if(p->s.size == nunits)
 776:	02e48c63          	beq	s1,a4,7ae <malloc+0xa8>
        p->s.size -= nunits;
 77a:	4137073b          	subw	a4,a4,s3
 77e:	c798                	sw	a4,8(a5)
        p += p->s.size;
 780:	02071693          	slli	a3,a4,0x20
 784:	01c6d713          	srli	a4,a3,0x1c
 788:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 78a:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 78e:	00000717          	auipc	a4,0x0
 792:	0ca73123          	sd	a0,194(a4) # 850 <freep>
      return (void*)(p + 1);
 796:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 79a:	70e2                	ld	ra,56(sp)
 79c:	7442                	ld	s0,48(sp)
 79e:	74a2                	ld	s1,40(sp)
 7a0:	7902                	ld	s2,32(sp)
 7a2:	69e2                	ld	s3,24(sp)
 7a4:	6a42                	ld	s4,16(sp)
 7a6:	6aa2                	ld	s5,8(sp)
 7a8:	6b02                	ld	s6,0(sp)
 7aa:	6121                	addi	sp,sp,64
 7ac:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 7ae:	6398                	ld	a4,0(a5)
 7b0:	e118                	sd	a4,0(a0)
 7b2:	bff1                	j	78e <malloc+0x88>
  hp->s.size = nu;
 7b4:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 7b8:	0541                	addi	a0,a0,16
 7ba:	00000097          	auipc	ra,0x0
 7be:	ec4080e7          	jalr	-316(ra) # 67e <free>
  return freep;
 7c2:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 7c6:	d971                	beqz	a0,79a <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 7ca:	4798                	lw	a4,8(a5)
 7cc:	fa9775e3          	bgeu	a4,s1,776 <malloc+0x70>
    if(p == freep)
 7d0:	00093703          	ld	a4,0(s2)
 7d4:	853e                	mv	a0,a5
 7d6:	fef719e3          	bne	a4,a5,7c8 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 7da:	8552                	mv	a0,s4
 7dc:	00000097          	auipc	ra,0x0
 7e0:	b5c080e7          	jalr	-1188(ra) # 338 <sbrk>
  if(p == (char*)-1)
 7e4:	fd5518e3          	bne	a0,s5,7b4 <malloc+0xae>
        return 0;
 7e8:	4501                	li	a0,0
 7ea:	bf45                	j	79a <malloc+0x94>
