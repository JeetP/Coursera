
user/_sleep:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <main>:
#include "kernel/param.h"
#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/syscall.h"
void main(int argc, char* argv[]){
   0:	1101                	addi	sp,sp,-32
   2:	ec06                	sd	ra,24(sp)
   4:	e822                	sd	s0,16(sp)
   6:	e426                	sd	s1,8(sp)
   8:	1000                	addi	s0,sp,32
   a:	84ae                	mv	s1,a1
    if(argc != 2)
   c:	4789                	li	a5,2
   e:	00f51f63          	bne	a0,a5,2c <main+0x2c>
        printf("Incorrect command: Ex. sleep 10\n");
    sleep(atoi(argv[1]));
  12:	6488                	ld	a0,8(s1)
  14:	00000097          	auipc	ra,0x0
  18:	19c080e7          	jalr	412(ra) # 1b0 <atoi>
  1c:	00000097          	auipc	ra,0x0
  20:	2a0080e7          	jalr	672(ra) # 2bc <sleep>
    exit();
  24:	00000097          	auipc	ra,0x0
  28:	208080e7          	jalr	520(ra) # 22c <exit>
        printf("Incorrect command: Ex. sleep 10\n");
  2c:	00000517          	auipc	a0,0x0
  30:	73c50513          	addi	a0,a0,1852 # 768 <malloc+0xe6>
  34:	00000097          	auipc	ra,0x0
  38:	590080e7          	jalr	1424(ra) # 5c4 <printf>
  3c:	bfd9                	j	12 <main+0x12>

000000000000003e <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
  3e:	1141                	addi	sp,sp,-16
  40:	e422                	sd	s0,8(sp)
  42:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  44:	87aa                	mv	a5,a0
  46:	0585                	addi	a1,a1,1
  48:	0785                	addi	a5,a5,1
  4a:	fff5c703          	lbu	a4,-1(a1)
  4e:	fee78fa3          	sb	a4,-1(a5)
  52:	fb75                	bnez	a4,46 <strcpy+0x8>
    ;
  return os;
}
  54:	6422                	ld	s0,8(sp)
  56:	0141                	addi	sp,sp,16
  58:	8082                	ret

000000000000005a <strcmp>:

int
strcmp(const char *p, const char *q)
{
  5a:	1141                	addi	sp,sp,-16
  5c:	e422                	sd	s0,8(sp)
  5e:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
  60:	00054783          	lbu	a5,0(a0)
  64:	cb91                	beqz	a5,78 <strcmp+0x1e>
  66:	0005c703          	lbu	a4,0(a1)
  6a:	00f71763          	bne	a4,a5,78 <strcmp+0x1e>
    p++, q++;
  6e:	0505                	addi	a0,a0,1
  70:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
  72:	00054783          	lbu	a5,0(a0)
  76:	fbe5                	bnez	a5,66 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
  78:	0005c503          	lbu	a0,0(a1)
}
  7c:	40a7853b          	subw	a0,a5,a0
  80:	6422                	ld	s0,8(sp)
  82:	0141                	addi	sp,sp,16
  84:	8082                	ret

0000000000000086 <strlen>:

uint
strlen(const char *s)
{
  86:	1141                	addi	sp,sp,-16
  88:	e422                	sd	s0,8(sp)
  8a:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
  8c:	00054783          	lbu	a5,0(a0)
  90:	cf91                	beqz	a5,ac <strlen+0x26>
  92:	0505                	addi	a0,a0,1
  94:	87aa                	mv	a5,a0
  96:	4685                	li	a3,1
  98:	9e89                	subw	a3,a3,a0
  9a:	00f6853b          	addw	a0,a3,a5
  9e:	0785                	addi	a5,a5,1
  a0:	fff7c703          	lbu	a4,-1(a5)
  a4:	fb7d                	bnez	a4,9a <strlen+0x14>
    ;
  return n;
}
  a6:	6422                	ld	s0,8(sp)
  a8:	0141                	addi	sp,sp,16
  aa:	8082                	ret
  for(n = 0; s[n]; n++)
  ac:	4501                	li	a0,0
  ae:	bfe5                	j	a6 <strlen+0x20>

00000000000000b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b0:	1141                	addi	sp,sp,-16
  b2:	e422                	sd	s0,8(sp)
  b4:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
  b6:	ca19                	beqz	a2,cc <memset+0x1c>
  b8:	87aa                	mv	a5,a0
  ba:	1602                	slli	a2,a2,0x20
  bc:	9201                	srli	a2,a2,0x20
  be:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
  c2:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
  c6:	0785                	addi	a5,a5,1
  c8:	fee79de3          	bne	a5,a4,c2 <memset+0x12>
  }
  return dst;
}
  cc:	6422                	ld	s0,8(sp)
  ce:	0141                	addi	sp,sp,16
  d0:	8082                	ret

00000000000000d2 <strchr>:

char*
strchr(const char *s, char c)
{
  d2:	1141                	addi	sp,sp,-16
  d4:	e422                	sd	s0,8(sp)
  d6:	0800                	addi	s0,sp,16
  for(; *s; s++)
  d8:	00054783          	lbu	a5,0(a0)
  dc:	cb99                	beqz	a5,f2 <strchr+0x20>
    if(*s == c)
  de:	00f58763          	beq	a1,a5,ec <strchr+0x1a>
  for(; *s; s++)
  e2:	0505                	addi	a0,a0,1
  e4:	00054783          	lbu	a5,0(a0)
  e8:	fbfd                	bnez	a5,de <strchr+0xc>
      return (char*)s;
  return 0;
  ea:	4501                	li	a0,0
}
  ec:	6422                	ld	s0,8(sp)
  ee:	0141                	addi	sp,sp,16
  f0:	8082                	ret
  return 0;
  f2:	4501                	li	a0,0
  f4:	bfe5                	j	ec <strchr+0x1a>

00000000000000f6 <gets>:

char*
gets(char *buf, int max)
{
  f6:	711d                	addi	sp,sp,-96
  f8:	ec86                	sd	ra,88(sp)
  fa:	e8a2                	sd	s0,80(sp)
  fc:	e4a6                	sd	s1,72(sp)
  fe:	e0ca                	sd	s2,64(sp)
 100:	fc4e                	sd	s3,56(sp)
 102:	f852                	sd	s4,48(sp)
 104:	f456                	sd	s5,40(sp)
 106:	f05a                	sd	s6,32(sp)
 108:	ec5e                	sd	s7,24(sp)
 10a:	1080                	addi	s0,sp,96
 10c:	8baa                	mv	s7,a0
 10e:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 110:	892a                	mv	s2,a0
 112:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 114:	4aa9                	li	s5,10
 116:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 118:	89a6                	mv	s3,s1
 11a:	2485                	addiw	s1,s1,1
 11c:	0344d863          	bge	s1,s4,14c <gets+0x56>
    cc = read(0, &c, 1);
 120:	4605                	li	a2,1
 122:	faf40593          	addi	a1,s0,-81
 126:	4501                	li	a0,0
 128:	00000097          	auipc	ra,0x0
 12c:	11c080e7          	jalr	284(ra) # 244 <read>
    if(cc < 1)
 130:	00a05e63          	blez	a0,14c <gets+0x56>
    buf[i++] = c;
 134:	faf44783          	lbu	a5,-81(s0)
 138:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 13c:	01578763          	beq	a5,s5,14a <gets+0x54>
 140:	0905                	addi	s2,s2,1
 142:	fd679be3          	bne	a5,s6,118 <gets+0x22>
  for(i=0; i+1 < max; ){
 146:	89a6                	mv	s3,s1
 148:	a011                	j	14c <gets+0x56>
 14a:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 14c:	99de                	add	s3,s3,s7
 14e:	00098023          	sb	zero,0(s3)
  return buf;
}
 152:	855e                	mv	a0,s7
 154:	60e6                	ld	ra,88(sp)
 156:	6446                	ld	s0,80(sp)
 158:	64a6                	ld	s1,72(sp)
 15a:	6906                	ld	s2,64(sp)
 15c:	79e2                	ld	s3,56(sp)
 15e:	7a42                	ld	s4,48(sp)
 160:	7aa2                	ld	s5,40(sp)
 162:	7b02                	ld	s6,32(sp)
 164:	6be2                	ld	s7,24(sp)
 166:	6125                	addi	sp,sp,96
 168:	8082                	ret

000000000000016a <stat>:

int
stat(const char *n, struct stat *st)
{
 16a:	1101                	addi	sp,sp,-32
 16c:	ec06                	sd	ra,24(sp)
 16e:	e822                	sd	s0,16(sp)
 170:	e426                	sd	s1,8(sp)
 172:	e04a                	sd	s2,0(sp)
 174:	1000                	addi	s0,sp,32
 176:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 178:	4581                	li	a1,0
 17a:	00000097          	auipc	ra,0x0
 17e:	0f2080e7          	jalr	242(ra) # 26c <open>
  if(fd < 0)
 182:	02054563          	bltz	a0,1ac <stat+0x42>
 186:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 188:	85ca                	mv	a1,s2
 18a:	00000097          	auipc	ra,0x0
 18e:	0fa080e7          	jalr	250(ra) # 284 <fstat>
 192:	892a                	mv	s2,a0
  close(fd);
 194:	8526                	mv	a0,s1
 196:	00000097          	auipc	ra,0x0
 19a:	0be080e7          	jalr	190(ra) # 254 <close>
  return r;
}
 19e:	854a                	mv	a0,s2
 1a0:	60e2                	ld	ra,24(sp)
 1a2:	6442                	ld	s0,16(sp)
 1a4:	64a2                	ld	s1,8(sp)
 1a6:	6902                	ld	s2,0(sp)
 1a8:	6105                	addi	sp,sp,32
 1aa:	8082                	ret
    return -1;
 1ac:	597d                	li	s2,-1
 1ae:	bfc5                	j	19e <stat+0x34>

00000000000001b0 <atoi>:

int
atoi(const char *s)
{
 1b0:	1141                	addi	sp,sp,-16
 1b2:	e422                	sd	s0,8(sp)
 1b4:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1b6:	00054603          	lbu	a2,0(a0)
 1ba:	fd06079b          	addiw	a5,a2,-48
 1be:	0ff7f793          	andi	a5,a5,255
 1c2:	4725                	li	a4,9
 1c4:	02f76963          	bltu	a4,a5,1f6 <atoi+0x46>
 1c8:	86aa                	mv	a3,a0
  n = 0;
 1ca:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 1cc:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 1ce:	0685                	addi	a3,a3,1
 1d0:	0025179b          	slliw	a5,a0,0x2
 1d4:	9fa9                	addw	a5,a5,a0
 1d6:	0017979b          	slliw	a5,a5,0x1
 1da:	9fb1                	addw	a5,a5,a2
 1dc:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 1e0:	0006c603          	lbu	a2,0(a3)
 1e4:	fd06071b          	addiw	a4,a2,-48
 1e8:	0ff77713          	andi	a4,a4,255
 1ec:	fee5f1e3          	bgeu	a1,a4,1ce <atoi+0x1e>
  return n;
}
 1f0:	6422                	ld	s0,8(sp)
 1f2:	0141                	addi	sp,sp,16
 1f4:	8082                	ret
  n = 0;
 1f6:	4501                	li	a0,0
 1f8:	bfe5                	j	1f0 <atoi+0x40>

00000000000001fa <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 1fa:	1141                	addi	sp,sp,-16
 1fc:	e422                	sd	s0,8(sp)
 1fe:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 200:	00c05f63          	blez	a2,21e <memmove+0x24>
 204:	1602                	slli	a2,a2,0x20
 206:	9201                	srli	a2,a2,0x20
 208:	00c506b3          	add	a3,a0,a2
  dst = vdst;
 20c:	87aa                	mv	a5,a0
    *dst++ = *src++;
 20e:	0585                	addi	a1,a1,1
 210:	0785                	addi	a5,a5,1
 212:	fff5c703          	lbu	a4,-1(a1)
 216:	fee78fa3          	sb	a4,-1(a5)
  while(n-- > 0)
 21a:	fed79ae3          	bne	a5,a3,20e <memmove+0x14>
  return vdst;
}
 21e:	6422                	ld	s0,8(sp)
 220:	0141                	addi	sp,sp,16
 222:	8082                	ret

0000000000000224 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 224:	4885                	li	a7,1
 ecall
 226:	00000073          	ecall
 ret
 22a:	8082                	ret

000000000000022c <exit>:
.global exit
exit:
 li a7, SYS_exit
 22c:	4889                	li	a7,2
 ecall
 22e:	00000073          	ecall
 ret
 232:	8082                	ret

0000000000000234 <wait>:
.global wait
wait:
 li a7, SYS_wait
 234:	488d                	li	a7,3
 ecall
 236:	00000073          	ecall
 ret
 23a:	8082                	ret

000000000000023c <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 23c:	4891                	li	a7,4
 ecall
 23e:	00000073          	ecall
 ret
 242:	8082                	ret

0000000000000244 <read>:
.global read
read:
 li a7, SYS_read
 244:	4895                	li	a7,5
 ecall
 246:	00000073          	ecall
 ret
 24a:	8082                	ret

000000000000024c <write>:
.global write
write:
 li a7, SYS_write
 24c:	48c1                	li	a7,16
 ecall
 24e:	00000073          	ecall
 ret
 252:	8082                	ret

0000000000000254 <close>:
.global close
close:
 li a7, SYS_close
 254:	48d5                	li	a7,21
 ecall
 256:	00000073          	ecall
 ret
 25a:	8082                	ret

000000000000025c <kill>:
.global kill
kill:
 li a7, SYS_kill
 25c:	4899                	li	a7,6
 ecall
 25e:	00000073          	ecall
 ret
 262:	8082                	ret

0000000000000264 <exec>:
.global exec
exec:
 li a7, SYS_exec
 264:	489d                	li	a7,7
 ecall
 266:	00000073          	ecall
 ret
 26a:	8082                	ret

000000000000026c <open>:
.global open
open:
 li a7, SYS_open
 26c:	48bd                	li	a7,15
 ecall
 26e:	00000073          	ecall
 ret
 272:	8082                	ret

0000000000000274 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 274:	48c5                	li	a7,17
 ecall
 276:	00000073          	ecall
 ret
 27a:	8082                	ret

000000000000027c <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 27c:	48c9                	li	a7,18
 ecall
 27e:	00000073          	ecall
 ret
 282:	8082                	ret

0000000000000284 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 284:	48a1                	li	a7,8
 ecall
 286:	00000073          	ecall
 ret
 28a:	8082                	ret

000000000000028c <link>:
.global link
link:
 li a7, SYS_link
 28c:	48cd                	li	a7,19
 ecall
 28e:	00000073          	ecall
 ret
 292:	8082                	ret

0000000000000294 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 294:	48d1                	li	a7,20
 ecall
 296:	00000073          	ecall
 ret
 29a:	8082                	ret

000000000000029c <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 29c:	48a5                	li	a7,9
 ecall
 29e:	00000073          	ecall
 ret
 2a2:	8082                	ret

00000000000002a4 <dup>:
.global dup
dup:
 li a7, SYS_dup
 2a4:	48a9                	li	a7,10
 ecall
 2a6:	00000073          	ecall
 ret
 2aa:	8082                	ret

00000000000002ac <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 2ac:	48ad                	li	a7,11
 ecall
 2ae:	00000073          	ecall
 ret
 2b2:	8082                	ret

00000000000002b4 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 2b4:	48b1                	li	a7,12
 ecall
 2b6:	00000073          	ecall
 ret
 2ba:	8082                	ret

00000000000002bc <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 2bc:	48b5                	li	a7,13
 ecall
 2be:	00000073          	ecall
 ret
 2c2:	8082                	ret

00000000000002c4 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 2c4:	48b9                	li	a7,14
 ecall
 2c6:	00000073          	ecall
 ret
 2ca:	8082                	ret

00000000000002cc <ntas>:
.global ntas
ntas:
 li a7, SYS_ntas
 2cc:	48d9                	li	a7,22
 ecall
 2ce:	00000073          	ecall
 ret
 2d2:	8082                	ret

00000000000002d4 <crash>:
.global crash
crash:
 li a7, SYS_crash
 2d4:	48dd                	li	a7,23
 ecall
 2d6:	00000073          	ecall
 ret
 2da:	8082                	ret

00000000000002dc <mount>:
.global mount
mount:
 li a7, SYS_mount
 2dc:	48e1                	li	a7,24
 ecall
 2de:	00000073          	ecall
 ret
 2e2:	8082                	ret

00000000000002e4 <umount>:
.global umount
umount:
 li a7, SYS_umount
 2e4:	48e5                	li	a7,25
 ecall
 2e6:	00000073          	ecall
 ret
 2ea:	8082                	ret

00000000000002ec <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 2ec:	1101                	addi	sp,sp,-32
 2ee:	ec06                	sd	ra,24(sp)
 2f0:	e822                	sd	s0,16(sp)
 2f2:	1000                	addi	s0,sp,32
 2f4:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 2f8:	4605                	li	a2,1
 2fa:	fef40593          	addi	a1,s0,-17
 2fe:	00000097          	auipc	ra,0x0
 302:	f4e080e7          	jalr	-178(ra) # 24c <write>
}
 306:	60e2                	ld	ra,24(sp)
 308:	6442                	ld	s0,16(sp)
 30a:	6105                	addi	sp,sp,32
 30c:	8082                	ret

000000000000030e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 30e:	7139                	addi	sp,sp,-64
 310:	fc06                	sd	ra,56(sp)
 312:	f822                	sd	s0,48(sp)
 314:	f426                	sd	s1,40(sp)
 316:	f04a                	sd	s2,32(sp)
 318:	ec4e                	sd	s3,24(sp)
 31a:	0080                	addi	s0,sp,64
 31c:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 31e:	c299                	beqz	a3,324 <printint+0x16>
 320:	0805c863          	bltz	a1,3b0 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 324:	2581                	sext.w	a1,a1
  neg = 0;
 326:	4881                	li	a7,0
 328:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 32c:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 32e:	2601                	sext.w	a2,a2
 330:	00000517          	auipc	a0,0x0
 334:	46850513          	addi	a0,a0,1128 # 798 <digits>
 338:	883a                	mv	a6,a4
 33a:	2705                	addiw	a4,a4,1
 33c:	02c5f7bb          	remuw	a5,a1,a2
 340:	1782                	slli	a5,a5,0x20
 342:	9381                	srli	a5,a5,0x20
 344:	97aa                	add	a5,a5,a0
 346:	0007c783          	lbu	a5,0(a5)
 34a:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 34e:	0005879b          	sext.w	a5,a1
 352:	02c5d5bb          	divuw	a1,a1,a2
 356:	0685                	addi	a3,a3,1
 358:	fec7f0e3          	bgeu	a5,a2,338 <printint+0x2a>
  if(neg)
 35c:	00088b63          	beqz	a7,372 <printint+0x64>
    buf[i++] = '-';
 360:	fd040793          	addi	a5,s0,-48
 364:	973e                	add	a4,a4,a5
 366:	02d00793          	li	a5,45
 36a:	fef70823          	sb	a5,-16(a4)
 36e:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 372:	02e05863          	blez	a4,3a2 <printint+0x94>
 376:	fc040793          	addi	a5,s0,-64
 37a:	00e78933          	add	s2,a5,a4
 37e:	fff78993          	addi	s3,a5,-1
 382:	99ba                	add	s3,s3,a4
 384:	377d                	addiw	a4,a4,-1
 386:	1702                	slli	a4,a4,0x20
 388:	9301                	srli	a4,a4,0x20
 38a:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 38e:	fff94583          	lbu	a1,-1(s2)
 392:	8526                	mv	a0,s1
 394:	00000097          	auipc	ra,0x0
 398:	f58080e7          	jalr	-168(ra) # 2ec <putc>
  while(--i >= 0)
 39c:	197d                	addi	s2,s2,-1
 39e:	ff3918e3          	bne	s2,s3,38e <printint+0x80>
}
 3a2:	70e2                	ld	ra,56(sp)
 3a4:	7442                	ld	s0,48(sp)
 3a6:	74a2                	ld	s1,40(sp)
 3a8:	7902                	ld	s2,32(sp)
 3aa:	69e2                	ld	s3,24(sp)
 3ac:	6121                	addi	sp,sp,64
 3ae:	8082                	ret
    x = -xx;
 3b0:	40b005bb          	negw	a1,a1
    neg = 1;
 3b4:	4885                	li	a7,1
    x = -xx;
 3b6:	bf8d                	j	328 <printint+0x1a>

00000000000003b8 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 3b8:	7119                	addi	sp,sp,-128
 3ba:	fc86                	sd	ra,120(sp)
 3bc:	f8a2                	sd	s0,112(sp)
 3be:	f4a6                	sd	s1,104(sp)
 3c0:	f0ca                	sd	s2,96(sp)
 3c2:	ecce                	sd	s3,88(sp)
 3c4:	e8d2                	sd	s4,80(sp)
 3c6:	e4d6                	sd	s5,72(sp)
 3c8:	e0da                	sd	s6,64(sp)
 3ca:	fc5e                	sd	s7,56(sp)
 3cc:	f862                	sd	s8,48(sp)
 3ce:	f466                	sd	s9,40(sp)
 3d0:	f06a                	sd	s10,32(sp)
 3d2:	ec6e                	sd	s11,24(sp)
 3d4:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 3d6:	0005c903          	lbu	s2,0(a1)
 3da:	18090f63          	beqz	s2,578 <vprintf+0x1c0>
 3de:	8aaa                	mv	s5,a0
 3e0:	8b32                	mv	s6,a2
 3e2:	00158493          	addi	s1,a1,1
  state = 0;
 3e6:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 3e8:	02500a13          	li	s4,37
      if(c == 'd'){
 3ec:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 3f0:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 3f4:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 3f8:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 3fc:	00000b97          	auipc	s7,0x0
 400:	39cb8b93          	addi	s7,s7,924 # 798 <digits>
 404:	a839                	j	422 <vprintf+0x6a>
        putc(fd, c);
 406:	85ca                	mv	a1,s2
 408:	8556                	mv	a0,s5
 40a:	00000097          	auipc	ra,0x0
 40e:	ee2080e7          	jalr	-286(ra) # 2ec <putc>
 412:	a019                	j	418 <vprintf+0x60>
    } else if(state == '%'){
 414:	01498f63          	beq	s3,s4,432 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 418:	0485                	addi	s1,s1,1
 41a:	fff4c903          	lbu	s2,-1(s1)
 41e:	14090d63          	beqz	s2,578 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 422:	0009079b          	sext.w	a5,s2
    if(state == 0){
 426:	fe0997e3          	bnez	s3,414 <vprintf+0x5c>
      if(c == '%'){
 42a:	fd479ee3          	bne	a5,s4,406 <vprintf+0x4e>
        state = '%';
 42e:	89be                	mv	s3,a5
 430:	b7e5                	j	418 <vprintf+0x60>
      if(c == 'd'){
 432:	05878063          	beq	a5,s8,472 <vprintf+0xba>
      } else if(c == 'l') {
 436:	05978c63          	beq	a5,s9,48e <vprintf+0xd6>
      } else if(c == 'x') {
 43a:	07a78863          	beq	a5,s10,4aa <vprintf+0xf2>
      } else if(c == 'p') {
 43e:	09b78463          	beq	a5,s11,4c6 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 442:	07300713          	li	a4,115
 446:	0ce78663          	beq	a5,a4,512 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 44a:	06300713          	li	a4,99
 44e:	0ee78e63          	beq	a5,a4,54a <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 452:	11478863          	beq	a5,s4,562 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 456:	85d2                	mv	a1,s4
 458:	8556                	mv	a0,s5
 45a:	00000097          	auipc	ra,0x0
 45e:	e92080e7          	jalr	-366(ra) # 2ec <putc>
        putc(fd, c);
 462:	85ca                	mv	a1,s2
 464:	8556                	mv	a0,s5
 466:	00000097          	auipc	ra,0x0
 46a:	e86080e7          	jalr	-378(ra) # 2ec <putc>
      }
      state = 0;
 46e:	4981                	li	s3,0
 470:	b765                	j	418 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 472:	008b0913          	addi	s2,s6,8
 476:	4685                	li	a3,1
 478:	4629                	li	a2,10
 47a:	000b2583          	lw	a1,0(s6)
 47e:	8556                	mv	a0,s5
 480:	00000097          	auipc	ra,0x0
 484:	e8e080e7          	jalr	-370(ra) # 30e <printint>
 488:	8b4a                	mv	s6,s2
      state = 0;
 48a:	4981                	li	s3,0
 48c:	b771                	j	418 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 48e:	008b0913          	addi	s2,s6,8
 492:	4681                	li	a3,0
 494:	4629                	li	a2,10
 496:	000b2583          	lw	a1,0(s6)
 49a:	8556                	mv	a0,s5
 49c:	00000097          	auipc	ra,0x0
 4a0:	e72080e7          	jalr	-398(ra) # 30e <printint>
 4a4:	8b4a                	mv	s6,s2
      state = 0;
 4a6:	4981                	li	s3,0
 4a8:	bf85                	j	418 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 4aa:	008b0913          	addi	s2,s6,8
 4ae:	4681                	li	a3,0
 4b0:	4641                	li	a2,16
 4b2:	000b2583          	lw	a1,0(s6)
 4b6:	8556                	mv	a0,s5
 4b8:	00000097          	auipc	ra,0x0
 4bc:	e56080e7          	jalr	-426(ra) # 30e <printint>
 4c0:	8b4a                	mv	s6,s2
      state = 0;
 4c2:	4981                	li	s3,0
 4c4:	bf91                	j	418 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 4c6:	008b0793          	addi	a5,s6,8
 4ca:	f8f43423          	sd	a5,-120(s0)
 4ce:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 4d2:	03000593          	li	a1,48
 4d6:	8556                	mv	a0,s5
 4d8:	00000097          	auipc	ra,0x0
 4dc:	e14080e7          	jalr	-492(ra) # 2ec <putc>
  putc(fd, 'x');
 4e0:	85ea                	mv	a1,s10
 4e2:	8556                	mv	a0,s5
 4e4:	00000097          	auipc	ra,0x0
 4e8:	e08080e7          	jalr	-504(ra) # 2ec <putc>
 4ec:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 4ee:	03c9d793          	srli	a5,s3,0x3c
 4f2:	97de                	add	a5,a5,s7
 4f4:	0007c583          	lbu	a1,0(a5)
 4f8:	8556                	mv	a0,s5
 4fa:	00000097          	auipc	ra,0x0
 4fe:	df2080e7          	jalr	-526(ra) # 2ec <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 502:	0992                	slli	s3,s3,0x4
 504:	397d                	addiw	s2,s2,-1
 506:	fe0914e3          	bnez	s2,4ee <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 50a:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 50e:	4981                	li	s3,0
 510:	b721                	j	418 <vprintf+0x60>
        s = va_arg(ap, char*);
 512:	008b0993          	addi	s3,s6,8
 516:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 51a:	02090163          	beqz	s2,53c <vprintf+0x184>
        while(*s != 0){
 51e:	00094583          	lbu	a1,0(s2)
 522:	c9a1                	beqz	a1,572 <vprintf+0x1ba>
          putc(fd, *s);
 524:	8556                	mv	a0,s5
 526:	00000097          	auipc	ra,0x0
 52a:	dc6080e7          	jalr	-570(ra) # 2ec <putc>
          s++;
 52e:	0905                	addi	s2,s2,1
        while(*s != 0){
 530:	00094583          	lbu	a1,0(s2)
 534:	f9e5                	bnez	a1,524 <vprintf+0x16c>
        s = va_arg(ap, char*);
 536:	8b4e                	mv	s6,s3
      state = 0;
 538:	4981                	li	s3,0
 53a:	bdf9                	j	418 <vprintf+0x60>
          s = "(null)";
 53c:	00000917          	auipc	s2,0x0
 540:	25490913          	addi	s2,s2,596 # 790 <malloc+0x10e>
        while(*s != 0){
 544:	02800593          	li	a1,40
 548:	bff1                	j	524 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 54a:	008b0913          	addi	s2,s6,8
 54e:	000b4583          	lbu	a1,0(s6)
 552:	8556                	mv	a0,s5
 554:	00000097          	auipc	ra,0x0
 558:	d98080e7          	jalr	-616(ra) # 2ec <putc>
 55c:	8b4a                	mv	s6,s2
      state = 0;
 55e:	4981                	li	s3,0
 560:	bd65                	j	418 <vprintf+0x60>
        putc(fd, c);
 562:	85d2                	mv	a1,s4
 564:	8556                	mv	a0,s5
 566:	00000097          	auipc	ra,0x0
 56a:	d86080e7          	jalr	-634(ra) # 2ec <putc>
      state = 0;
 56e:	4981                	li	s3,0
 570:	b565                	j	418 <vprintf+0x60>
        s = va_arg(ap, char*);
 572:	8b4e                	mv	s6,s3
      state = 0;
 574:	4981                	li	s3,0
 576:	b54d                	j	418 <vprintf+0x60>
    }
  }
}
 578:	70e6                	ld	ra,120(sp)
 57a:	7446                	ld	s0,112(sp)
 57c:	74a6                	ld	s1,104(sp)
 57e:	7906                	ld	s2,96(sp)
 580:	69e6                	ld	s3,88(sp)
 582:	6a46                	ld	s4,80(sp)
 584:	6aa6                	ld	s5,72(sp)
 586:	6b06                	ld	s6,64(sp)
 588:	7be2                	ld	s7,56(sp)
 58a:	7c42                	ld	s8,48(sp)
 58c:	7ca2                	ld	s9,40(sp)
 58e:	7d02                	ld	s10,32(sp)
 590:	6de2                	ld	s11,24(sp)
 592:	6109                	addi	sp,sp,128
 594:	8082                	ret

0000000000000596 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 596:	715d                	addi	sp,sp,-80
 598:	ec06                	sd	ra,24(sp)
 59a:	e822                	sd	s0,16(sp)
 59c:	1000                	addi	s0,sp,32
 59e:	e010                	sd	a2,0(s0)
 5a0:	e414                	sd	a3,8(s0)
 5a2:	e818                	sd	a4,16(s0)
 5a4:	ec1c                	sd	a5,24(s0)
 5a6:	03043023          	sd	a6,32(s0)
 5aa:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 5ae:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 5b2:	8622                	mv	a2,s0
 5b4:	00000097          	auipc	ra,0x0
 5b8:	e04080e7          	jalr	-508(ra) # 3b8 <vprintf>
}
 5bc:	60e2                	ld	ra,24(sp)
 5be:	6442                	ld	s0,16(sp)
 5c0:	6161                	addi	sp,sp,80
 5c2:	8082                	ret

00000000000005c4 <printf>:

void
printf(const char *fmt, ...)
{
 5c4:	711d                	addi	sp,sp,-96
 5c6:	ec06                	sd	ra,24(sp)
 5c8:	e822                	sd	s0,16(sp)
 5ca:	1000                	addi	s0,sp,32
 5cc:	e40c                	sd	a1,8(s0)
 5ce:	e810                	sd	a2,16(s0)
 5d0:	ec14                	sd	a3,24(s0)
 5d2:	f018                	sd	a4,32(s0)
 5d4:	f41c                	sd	a5,40(s0)
 5d6:	03043823          	sd	a6,48(s0)
 5da:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 5de:	00840613          	addi	a2,s0,8
 5e2:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 5e6:	85aa                	mv	a1,a0
 5e8:	4505                	li	a0,1
 5ea:	00000097          	auipc	ra,0x0
 5ee:	dce080e7          	jalr	-562(ra) # 3b8 <vprintf>
}
 5f2:	60e2                	ld	ra,24(sp)
 5f4:	6442                	ld	s0,16(sp)
 5f6:	6125                	addi	sp,sp,96
 5f8:	8082                	ret

00000000000005fa <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5fa:	1141                	addi	sp,sp,-16
 5fc:	e422                	sd	s0,8(sp)
 5fe:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 600:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 604:	00000797          	auipc	a5,0x0
 608:	1ac7b783          	ld	a5,428(a5) # 7b0 <freep>
 60c:	a805                	j	63c <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 60e:	4618                	lw	a4,8(a2)
 610:	9db9                	addw	a1,a1,a4
 612:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 616:	6398                	ld	a4,0(a5)
 618:	6318                	ld	a4,0(a4)
 61a:	fee53823          	sd	a4,-16(a0)
 61e:	a091                	j	662 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 620:	ff852703          	lw	a4,-8(a0)
 624:	9e39                	addw	a2,a2,a4
 626:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 628:	ff053703          	ld	a4,-16(a0)
 62c:	e398                	sd	a4,0(a5)
 62e:	a099                	j	674 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 630:	6398                	ld	a4,0(a5)
 632:	00e7e463          	bltu	a5,a4,63a <free+0x40>
 636:	00e6ea63          	bltu	a3,a4,64a <free+0x50>
{
 63a:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63c:	fed7fae3          	bgeu	a5,a3,630 <free+0x36>
 640:	6398                	ld	a4,0(a5)
 642:	00e6e463          	bltu	a3,a4,64a <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 646:	fee7eae3          	bltu	a5,a4,63a <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 64a:	ff852583          	lw	a1,-8(a0)
 64e:	6390                	ld	a2,0(a5)
 650:	02059813          	slli	a6,a1,0x20
 654:	01c85713          	srli	a4,a6,0x1c
 658:	9736                	add	a4,a4,a3
 65a:	fae60ae3          	beq	a2,a4,60e <free+0x14>
    bp->s.ptr = p->s.ptr;
 65e:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 662:	4790                	lw	a2,8(a5)
 664:	02061593          	slli	a1,a2,0x20
 668:	01c5d713          	srli	a4,a1,0x1c
 66c:	973e                	add	a4,a4,a5
 66e:	fae689e3          	beq	a3,a4,620 <free+0x26>
  } else
    p->s.ptr = bp;
 672:	e394                	sd	a3,0(a5)
  freep = p;
 674:	00000717          	auipc	a4,0x0
 678:	12f73e23          	sd	a5,316(a4) # 7b0 <freep>
}
 67c:	6422                	ld	s0,8(sp)
 67e:	0141                	addi	sp,sp,16
 680:	8082                	ret

0000000000000682 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 682:	7139                	addi	sp,sp,-64
 684:	fc06                	sd	ra,56(sp)
 686:	f822                	sd	s0,48(sp)
 688:	f426                	sd	s1,40(sp)
 68a:	f04a                	sd	s2,32(sp)
 68c:	ec4e                	sd	s3,24(sp)
 68e:	e852                	sd	s4,16(sp)
 690:	e456                	sd	s5,8(sp)
 692:	e05a                	sd	s6,0(sp)
 694:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 696:	02051493          	slli	s1,a0,0x20
 69a:	9081                	srli	s1,s1,0x20
 69c:	04bd                	addi	s1,s1,15
 69e:	8091                	srli	s1,s1,0x4
 6a0:	0014899b          	addiw	s3,s1,1
 6a4:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 6a6:	00000517          	auipc	a0,0x0
 6aa:	10a53503          	ld	a0,266(a0) # 7b0 <freep>
 6ae:	c515                	beqz	a0,6da <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b0:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 6b2:	4798                	lw	a4,8(a5)
 6b4:	02977f63          	bgeu	a4,s1,6f2 <malloc+0x70>
 6b8:	8a4e                	mv	s4,s3
 6ba:	0009871b          	sext.w	a4,s3
 6be:	6685                	lui	a3,0x1
 6c0:	00d77363          	bgeu	a4,a3,6c6 <malloc+0x44>
 6c4:	6a05                	lui	s4,0x1
 6c6:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 6ca:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6ce:	00000917          	auipc	s2,0x0
 6d2:	0e290913          	addi	s2,s2,226 # 7b0 <freep>
  if(p == (char*)-1)
 6d6:	5afd                	li	s5,-1
 6d8:	a895                	j	74c <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 6da:	00000797          	auipc	a5,0x0
 6de:	0de78793          	addi	a5,a5,222 # 7b8 <base>
 6e2:	00000717          	auipc	a4,0x0
 6e6:	0cf73723          	sd	a5,206(a4) # 7b0 <freep>
 6ea:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 6ec:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 6f0:	b7e1                	j	6b8 <malloc+0x36>
      if(p->s.size == nunits)
 6f2:	02e48c63          	beq	s1,a4,72a <malloc+0xa8>
        p->s.size -= nunits;
 6f6:	4137073b          	subw	a4,a4,s3
 6fa:	c798                	sw	a4,8(a5)
        p += p->s.size;
 6fc:	02071693          	slli	a3,a4,0x20
 700:	01c6d713          	srli	a4,a3,0x1c
 704:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 706:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 70a:	00000717          	auipc	a4,0x0
 70e:	0aa73323          	sd	a0,166(a4) # 7b0 <freep>
      return (void*)(p + 1);
 712:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 716:	70e2                	ld	ra,56(sp)
 718:	7442                	ld	s0,48(sp)
 71a:	74a2                	ld	s1,40(sp)
 71c:	7902                	ld	s2,32(sp)
 71e:	69e2                	ld	s3,24(sp)
 720:	6a42                	ld	s4,16(sp)
 722:	6aa2                	ld	s5,8(sp)
 724:	6b02                	ld	s6,0(sp)
 726:	6121                	addi	sp,sp,64
 728:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 72a:	6398                	ld	a4,0(a5)
 72c:	e118                	sd	a4,0(a0)
 72e:	bff1                	j	70a <malloc+0x88>
  hp->s.size = nu;
 730:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 734:	0541                	addi	a0,a0,16
 736:	00000097          	auipc	ra,0x0
 73a:	ec4080e7          	jalr	-316(ra) # 5fa <free>
  return freep;
 73e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 742:	d971                	beqz	a0,716 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 744:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 746:	4798                	lw	a4,8(a5)
 748:	fa9775e3          	bgeu	a4,s1,6f2 <malloc+0x70>
    if(p == freep)
 74c:	00093703          	ld	a4,0(s2)
 750:	853e                	mv	a0,a5
 752:	fef719e3          	bne	a4,a5,744 <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 756:	8552                	mv	a0,s4
 758:	00000097          	auipc	ra,0x0
 75c:	b5c080e7          	jalr	-1188(ra) # 2b4 <sbrk>
  if(p == (char*)-1)
 760:	fd5518e3          	bne	a0,s5,730 <malloc+0xae>
        return 0;
 764:	4501                	li	a0,0
 766:	bf45                	j	716 <malloc+0x94>
