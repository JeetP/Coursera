
user/_uthread:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <thread_schedule>:
  current_thread->state = RUNNING;
}

static void 
thread_schedule(void)
{
   0:	1141                	addi	sp,sp,-16
   2:	e406                	sd	ra,8(sp)
   4:	e022                	sd	s0,0(sp)
   6:	0800                	addi	s0,sp,16
  thread_p t;

  /* Find another runnable thread. */
  next_thread = 0;
   8:	00001797          	auipc	a5,0x1
   c:	9c07bc23          	sd	zero,-1576(a5) # 9e0 <next_thread>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
    if (t->state == RUNNABLE && t != current_thread) {
  10:	00001817          	auipc	a6,0x1
  14:	9d883803          	ld	a6,-1576(a6) # 9e8 <current_thread>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
  18:	00001797          	auipc	a5,0x1
  1c:	9e078793          	addi	a5,a5,-1568 # 9f8 <all_thread>
    if (t->state == RUNNABLE && t != current_thread) {
  20:	6709                	lui	a4,0x2
  22:	00870593          	addi	a1,a4,8 # 2008 <__global_pointer$+0xe2f>
  26:	4609                	li	a2,2
  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
  28:	0741                	addi	a4,a4,16
  2a:	00009517          	auipc	a0,0x9
  2e:	a0e50513          	addi	a0,a0,-1522 # 8a38 <base>
  32:	a021                	j	3a <thread_schedule+0x3a>
  34:	97ba                	add	a5,a5,a4
  36:	08a78063          	beq	a5,a0,b6 <thread_schedule+0xb6>
    if (t->state == RUNNABLE && t != current_thread) {
  3a:	00b786b3          	add	a3,a5,a1
  3e:	4294                	lw	a3,0(a3)
  40:	fec69ae3          	bne	a3,a2,34 <thread_schedule+0x34>
  44:	fef808e3          	beq	a6,a5,34 <thread_schedule+0x34>
       next_thread = t;
  48:	00001717          	auipc	a4,0x1
  4c:	98f73c23          	sd	a5,-1640(a4) # 9e0 <next_thread>
      break;
    }
  }

  if (t >= all_thread + MAX_THREAD && current_thread->state == RUNNABLE) {
  50:	00009717          	auipc	a4,0x9
  54:	9e870713          	addi	a4,a4,-1560 # 8a38 <base>
  58:	00e7ef63          	bltu	a5,a4,76 <thread_schedule+0x76>
  5c:	6789                	lui	a5,0x2
  5e:	97c2                	add	a5,a5,a6
  60:	4798                	lw	a4,8(a5)
  62:	4789                	li	a5,2
  64:	06f70063          	beq	a4,a5,c4 <thread_schedule+0xc4>
    /* The current thread is the only runnable thread; run it. */
    next_thread = current_thread;
  }

  if (next_thread == 0) {
  68:	00001797          	auipc	a5,0x1
  6c:	9787b783          	ld	a5,-1672(a5) # 9e0 <next_thread>
  70:	c79d                	beqz	a5,9e <thread_schedule+0x9e>
    printf("thread_schedule: no runnable threads\n");
    exit();
  }

  if (current_thread != next_thread) {         /* switch threads?  */
  72:	04f80963          	beq	a6,a5,c4 <thread_schedule+0xc4>
    next_thread->state = RUNNING;
  76:	6709                	lui	a4,0x2
  78:	97ba                	add	a5,a5,a4
  7a:	4705                	li	a4,1
  7c:	c798                	sw	a4,8(a5)
     uthread_switch((uint64) &current_thread, (uint64) &next_thread);
  7e:	00001597          	auipc	a1,0x1
  82:	96258593          	addi	a1,a1,-1694 # 9e0 <next_thread>
  86:	00001517          	auipc	a0,0x1
  8a:	96250513          	addi	a0,a0,-1694 # 9e8 <current_thread>
  8e:	00000097          	auipc	ra,0x0
  92:	19a080e7          	jalr	410(ra) # 228 <strcpy>
  } else
    next_thread = 0;
}
  96:	60a2                	ld	ra,8(sp)
  98:	6402                	ld	s0,0(sp)
  9a:	0141                	addi	sp,sp,16
  9c:	8082                	ret
    printf("thread_schedule: no runnable threads\n");
  9e:	00001517          	auipc	a0,0x1
  a2:	8ba50513          	addi	a0,a0,-1862 # 958 <malloc+0xec>
  a6:	00000097          	auipc	ra,0x0
  aa:	708080e7          	jalr	1800(ra) # 7ae <printf>
    exit();
  ae:	00000097          	auipc	ra,0x0
  b2:	368080e7          	jalr	872(ra) # 416 <exit>
  if (t >= all_thread + MAX_THREAD && current_thread->state == RUNNABLE) {
  b6:	6789                	lui	a5,0x2
  b8:	983e                	add	a6,a6,a5
  ba:	00882703          	lw	a4,8(a6)
  be:	4789                	li	a5,2
  c0:	fcf71fe3          	bne	a4,a5,9e <thread_schedule+0x9e>
    next_thread = 0;
  c4:	00001797          	auipc	a5,0x1
  c8:	9007be23          	sd	zero,-1764(a5) # 9e0 <next_thread>
}
  cc:	b7e9                	j	96 <thread_schedule+0x96>

00000000000000ce <thread_init>:
{
  ce:	1141                	addi	sp,sp,-16
  d0:	e422                	sd	s0,8(sp)
  d2:	0800                	addi	s0,sp,16
  current_thread = &all_thread[0];
  d4:	00001797          	auipc	a5,0x1
  d8:	92478793          	addi	a5,a5,-1756 # 9f8 <all_thread>
  dc:	00001717          	auipc	a4,0x1
  e0:	90f73623          	sd	a5,-1780(a4) # 9e8 <current_thread>
  current_thread->state = RUNNING;
  e4:	4785                	li	a5,1
  e6:	00003717          	auipc	a4,0x3
  ea:	90f72d23          	sw	a5,-1766(a4) # 2a00 <__global_pointer$+0x1827>
}
  ee:	6422                	ld	s0,8(sp)
  f0:	0141                	addi	sp,sp,16
  f2:	8082                	ret

00000000000000f4 <thread_create>:

void 
thread_create(void (*func)())
{
  f4:	1141                	addi	sp,sp,-16
  f6:	e422                	sd	s0,8(sp)
  f8:	0800                	addi	s0,sp,16
  thread_p t;

  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
  fa:	00001797          	auipc	a5,0x1
  fe:	8fe78793          	addi	a5,a5,-1794 # 9f8 <all_thread>
    if (t->state == FREE) break;
 102:	6709                	lui	a4,0x2
 104:	00870613          	addi	a2,a4,8 # 2008 <__global_pointer$+0xe2f>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
 108:	0741                	addi	a4,a4,16
 10a:	00009597          	auipc	a1,0x9
 10e:	92e58593          	addi	a1,a1,-1746 # 8a38 <base>
    if (t->state == FREE) break;
 112:	00c786b3          	add	a3,a5,a2
 116:	4294                	lw	a3,0(a3)
 118:	c681                	beqz	a3,120 <thread_create+0x2c>
  for (t = all_thread; t < all_thread + MAX_THREAD; t++) {
 11a:	97ba                	add	a5,a5,a4
 11c:	feb79be3          	bne	a5,a1,112 <thread_create+0x1e>
  }
  t->sp = (uint64) (t->stack + STACK_SIZE);// set sp to the top of the stack
 120:	6689                	lui	a3,0x2
 122:	00868713          	addi	a4,a3,8 # 2008 <__global_pointer$+0xe2f>
 126:	973e                	add	a4,a4,a5
  t->sp -= 104;                            // space for registers that uthread_switch expects
 128:	f9870613          	addi	a2,a4,-104
 12c:	e390                	sd	a2,0(a5)
  * (uint64 *) (t->sp) = (uint64)func;     // push return address on stack
 12e:	f8a73c23          	sd	a0,-104(a4)
  t->state = RUNNABLE;
 132:	97b6                	add	a5,a5,a3
 134:	4709                	li	a4,2
 136:	c798                	sw	a4,8(a5)
}
 138:	6422                	ld	s0,8(sp)
 13a:	0141                	addi	sp,sp,16
 13c:	8082                	ret

000000000000013e <thread_yield>:

void 
thread_yield(void)
{
 13e:	1141                	addi	sp,sp,-16
 140:	e406                	sd	ra,8(sp)
 142:	e022                	sd	s0,0(sp)
 144:	0800                	addi	s0,sp,16
  current_thread->state = RUNNABLE;
 146:	00001797          	auipc	a5,0x1
 14a:	8a27b783          	ld	a5,-1886(a5) # 9e8 <current_thread>
 14e:	6709                	lui	a4,0x2
 150:	97ba                	add	a5,a5,a4
 152:	4709                	li	a4,2
 154:	c798                	sw	a4,8(a5)
  thread_schedule();
 156:	00000097          	auipc	ra,0x0
 15a:	eaa080e7          	jalr	-342(ra) # 0 <thread_schedule>
}
 15e:	60a2                	ld	ra,8(sp)
 160:	6402                	ld	s0,0(sp)
 162:	0141                	addi	sp,sp,16
 164:	8082                	ret

0000000000000166 <mythread>:

static void 
mythread(void)
{
 166:	7179                	addi	sp,sp,-48
 168:	f406                	sd	ra,40(sp)
 16a:	f022                	sd	s0,32(sp)
 16c:	ec26                	sd	s1,24(sp)
 16e:	e84a                	sd	s2,16(sp)
 170:	e44e                	sd	s3,8(sp)
 172:	1800                	addi	s0,sp,48
  int i;
  printf("my thread running\n");
 174:	00001517          	auipc	a0,0x1
 178:	80c50513          	addi	a0,a0,-2036 # 980 <malloc+0x114>
 17c:	00000097          	auipc	ra,0x0
 180:	632080e7          	jalr	1586(ra) # 7ae <printf>
 184:	06400493          	li	s1,100
  for (i = 0; i < 100; i++) {
    printf("my thread %p\n", (uint64) current_thread);
 188:	00001997          	auipc	s3,0x1
 18c:	86098993          	addi	s3,s3,-1952 # 9e8 <current_thread>
 190:	00001917          	auipc	s2,0x1
 194:	80890913          	addi	s2,s2,-2040 # 998 <malloc+0x12c>
 198:	0009b583          	ld	a1,0(s3)
 19c:	854a                	mv	a0,s2
 19e:	00000097          	auipc	ra,0x0
 1a2:	610080e7          	jalr	1552(ra) # 7ae <printf>
    thread_yield();
 1a6:	00000097          	auipc	ra,0x0
 1aa:	f98080e7          	jalr	-104(ra) # 13e <thread_yield>
  for (i = 0; i < 100; i++) {
 1ae:	34fd                	addiw	s1,s1,-1
 1b0:	f4e5                	bnez	s1,198 <mythread+0x32>
  }
  printf("my thread: exit\n");
 1b2:	00000517          	auipc	a0,0x0
 1b6:	7f650513          	addi	a0,a0,2038 # 9a8 <malloc+0x13c>
 1ba:	00000097          	auipc	ra,0x0
 1be:	5f4080e7          	jalr	1524(ra) # 7ae <printf>
  current_thread->state = FREE;
 1c2:	00001797          	auipc	a5,0x1
 1c6:	8267b783          	ld	a5,-2010(a5) # 9e8 <current_thread>
 1ca:	6709                	lui	a4,0x2
 1cc:	97ba                	add	a5,a5,a4
 1ce:	0007a423          	sw	zero,8(a5)
  thread_schedule();
 1d2:	00000097          	auipc	ra,0x0
 1d6:	e2e080e7          	jalr	-466(ra) # 0 <thread_schedule>
}
 1da:	70a2                	ld	ra,40(sp)
 1dc:	7402                	ld	s0,32(sp)
 1de:	64e2                	ld	s1,24(sp)
 1e0:	6942                	ld	s2,16(sp)
 1e2:	69a2                	ld	s3,8(sp)
 1e4:	6145                	addi	sp,sp,48
 1e6:	8082                	ret

00000000000001e8 <main>:


int 
main(int argc, char *argv[]) 
{
 1e8:	1141                	addi	sp,sp,-16
 1ea:	e406                	sd	ra,8(sp)
 1ec:	e022                	sd	s0,0(sp)
 1ee:	0800                	addi	s0,sp,16
  thread_init();
 1f0:	00000097          	auipc	ra,0x0
 1f4:	ede080e7          	jalr	-290(ra) # ce <thread_init>
  thread_create(mythread);
 1f8:	00000517          	auipc	a0,0x0
 1fc:	f6e50513          	addi	a0,a0,-146 # 166 <mythread>
 200:	00000097          	auipc	ra,0x0
 204:	ef4080e7          	jalr	-268(ra) # f4 <thread_create>
  thread_create(mythread);
 208:	00000517          	auipc	a0,0x0
 20c:	f5e50513          	addi	a0,a0,-162 # 166 <mythread>
 210:	00000097          	auipc	ra,0x0
 214:	ee4080e7          	jalr	-284(ra) # f4 <thread_create>
  thread_schedule();
 218:	00000097          	auipc	ra,0x0
 21c:	de8080e7          	jalr	-536(ra) # 0 <thread_schedule>
  exit();
 220:	00000097          	auipc	ra,0x0
 224:	1f6080e7          	jalr	502(ra) # 416 <exit>

0000000000000228 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 228:	1141                	addi	sp,sp,-16
 22a:	e422                	sd	s0,8(sp)
 22c:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 22e:	87aa                	mv	a5,a0
 230:	0585                	addi	a1,a1,1
 232:	0785                	addi	a5,a5,1
 234:	fff5c703          	lbu	a4,-1(a1)
 238:	fee78fa3          	sb	a4,-1(a5)
 23c:	fb75                	bnez	a4,230 <strcpy+0x8>
    ;
  return os;
}
 23e:	6422                	ld	s0,8(sp)
 240:	0141                	addi	sp,sp,16
 242:	8082                	ret

0000000000000244 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 244:	1141                	addi	sp,sp,-16
 246:	e422                	sd	s0,8(sp)
 248:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 24a:	00054783          	lbu	a5,0(a0)
 24e:	cb91                	beqz	a5,262 <strcmp+0x1e>
 250:	0005c703          	lbu	a4,0(a1)
 254:	00f71763          	bne	a4,a5,262 <strcmp+0x1e>
    p++, q++;
 258:	0505                	addi	a0,a0,1
 25a:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 25c:	00054783          	lbu	a5,0(a0)
 260:	fbe5                	bnez	a5,250 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 262:	0005c503          	lbu	a0,0(a1)
}
 266:	40a7853b          	subw	a0,a5,a0
 26a:	6422                	ld	s0,8(sp)
 26c:	0141                	addi	sp,sp,16
 26e:	8082                	ret

0000000000000270 <strlen>:

uint
strlen(const char *s)
{
 270:	1141                	addi	sp,sp,-16
 272:	e422                	sd	s0,8(sp)
 274:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 276:	00054783          	lbu	a5,0(a0)
 27a:	cf91                	beqz	a5,296 <strlen+0x26>
 27c:	0505                	addi	a0,a0,1
 27e:	87aa                	mv	a5,a0
 280:	4685                	li	a3,1
 282:	9e89                	subw	a3,a3,a0
 284:	00f6853b          	addw	a0,a3,a5
 288:	0785                	addi	a5,a5,1
 28a:	fff7c703          	lbu	a4,-1(a5)
 28e:	fb7d                	bnez	a4,284 <strlen+0x14>
    ;
  return n;
}
 290:	6422                	ld	s0,8(sp)
 292:	0141                	addi	sp,sp,16
 294:	8082                	ret
  for(n = 0; s[n]; n++)
 296:	4501                	li	a0,0
 298:	bfe5                	j	290 <strlen+0x20>

000000000000029a <memset>:

void*
memset(void *dst, int c, uint n)
{
 29a:	1141                	addi	sp,sp,-16
 29c:	e422                	sd	s0,8(sp)
 29e:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 2a0:	ca19                	beqz	a2,2b6 <memset+0x1c>
 2a2:	87aa                	mv	a5,a0
 2a4:	1602                	slli	a2,a2,0x20
 2a6:	9201                	srli	a2,a2,0x20
 2a8:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 2ac:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 2b0:	0785                	addi	a5,a5,1
 2b2:	fee79de3          	bne	a5,a4,2ac <memset+0x12>
  }
  return dst;
}
 2b6:	6422                	ld	s0,8(sp)
 2b8:	0141                	addi	sp,sp,16
 2ba:	8082                	ret

00000000000002bc <strchr>:

char*
strchr(const char *s, char c)
{
 2bc:	1141                	addi	sp,sp,-16
 2be:	e422                	sd	s0,8(sp)
 2c0:	0800                	addi	s0,sp,16
  for(; *s; s++)
 2c2:	00054783          	lbu	a5,0(a0)
 2c6:	cb99                	beqz	a5,2dc <strchr+0x20>
    if(*s == c)
 2c8:	00f58763          	beq	a1,a5,2d6 <strchr+0x1a>
  for(; *s; s++)
 2cc:	0505                	addi	a0,a0,1
 2ce:	00054783          	lbu	a5,0(a0)
 2d2:	fbfd                	bnez	a5,2c8 <strchr+0xc>
      return (char*)s;
  return 0;
 2d4:	4501                	li	a0,0
}
 2d6:	6422                	ld	s0,8(sp)
 2d8:	0141                	addi	sp,sp,16
 2da:	8082                	ret
  return 0;
 2dc:	4501                	li	a0,0
 2de:	bfe5                	j	2d6 <strchr+0x1a>

00000000000002e0 <gets>:

char*
gets(char *buf, int max)
{
 2e0:	711d                	addi	sp,sp,-96
 2e2:	ec86                	sd	ra,88(sp)
 2e4:	e8a2                	sd	s0,80(sp)
 2e6:	e4a6                	sd	s1,72(sp)
 2e8:	e0ca                	sd	s2,64(sp)
 2ea:	fc4e                	sd	s3,56(sp)
 2ec:	f852                	sd	s4,48(sp)
 2ee:	f456                	sd	s5,40(sp)
 2f0:	f05a                	sd	s6,32(sp)
 2f2:	ec5e                	sd	s7,24(sp)
 2f4:	1080                	addi	s0,sp,96
 2f6:	8baa                	mv	s7,a0
 2f8:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fa:	892a                	mv	s2,a0
 2fc:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 2fe:	4aa9                	li	s5,10
 300:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 302:	89a6                	mv	s3,s1
 304:	2485                	addiw	s1,s1,1
 306:	0344d863          	bge	s1,s4,336 <gets+0x56>
    cc = read(0, &c, 1);
 30a:	4605                	li	a2,1
 30c:	faf40593          	addi	a1,s0,-81
 310:	4501                	li	a0,0
 312:	00000097          	auipc	ra,0x0
 316:	11c080e7          	jalr	284(ra) # 42e <read>
    if(cc < 1)
 31a:	00a05e63          	blez	a0,336 <gets+0x56>
    buf[i++] = c;
 31e:	faf44783          	lbu	a5,-81(s0)
 322:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 326:	01578763          	beq	a5,s5,334 <gets+0x54>
 32a:	0905                	addi	s2,s2,1
 32c:	fd679be3          	bne	a5,s6,302 <gets+0x22>
  for(i=0; i+1 < max; ){
 330:	89a6                	mv	s3,s1
 332:	a011                	j	336 <gets+0x56>
 334:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 336:	99de                	add	s3,s3,s7
 338:	00098023          	sb	zero,0(s3)
  return buf;
}
 33c:	855e                	mv	a0,s7
 33e:	60e6                	ld	ra,88(sp)
 340:	6446                	ld	s0,80(sp)
 342:	64a6                	ld	s1,72(sp)
 344:	6906                	ld	s2,64(sp)
 346:	79e2                	ld	s3,56(sp)
 348:	7a42                	ld	s4,48(sp)
 34a:	7aa2                	ld	s5,40(sp)
 34c:	7b02                	ld	s6,32(sp)
 34e:	6be2                	ld	s7,24(sp)
 350:	6125                	addi	sp,sp,96
 352:	8082                	ret

0000000000000354 <stat>:

int
stat(const char *n, struct stat *st)
{
 354:	1101                	addi	sp,sp,-32
 356:	ec06                	sd	ra,24(sp)
 358:	e822                	sd	s0,16(sp)
 35a:	e426                	sd	s1,8(sp)
 35c:	e04a                	sd	s2,0(sp)
 35e:	1000                	addi	s0,sp,32
 360:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 362:	4581                	li	a1,0
 364:	00000097          	auipc	ra,0x0
 368:	0f2080e7          	jalr	242(ra) # 456 <open>
  if(fd < 0)
 36c:	02054563          	bltz	a0,396 <stat+0x42>
 370:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 372:	85ca                	mv	a1,s2
 374:	00000097          	auipc	ra,0x0
 378:	0fa080e7          	jalr	250(ra) # 46e <fstat>
 37c:	892a                	mv	s2,a0
  close(fd);
 37e:	8526                	mv	a0,s1
 380:	00000097          	auipc	ra,0x0
 384:	0be080e7          	jalr	190(ra) # 43e <close>
  return r;
}
 388:	854a                	mv	a0,s2
 38a:	60e2                	ld	ra,24(sp)
 38c:	6442                	ld	s0,16(sp)
 38e:	64a2                	ld	s1,8(sp)
 390:	6902                	ld	s2,0(sp)
 392:	6105                	addi	sp,sp,32
 394:	8082                	ret
    return -1;
 396:	597d                	li	s2,-1
 398:	bfc5                	j	388 <stat+0x34>

000000000000039a <atoi>:

int
atoi(const char *s)
{
 39a:	1141                	addi	sp,sp,-16
 39c:	e422                	sd	s0,8(sp)
 39e:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3a0:	00054603          	lbu	a2,0(a0)
 3a4:	fd06079b          	addiw	a5,a2,-48
 3a8:	0ff7f793          	andi	a5,a5,255
 3ac:	4725                	li	a4,9
 3ae:	02f76963          	bltu	a4,a5,3e0 <atoi+0x46>
 3b2:	86aa                	mv	a3,a0
  n = 0;
 3b4:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 3b6:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 3b8:	0685                	addi	a3,a3,1
 3ba:	0025179b          	slliw	a5,a0,0x2
 3be:	9fa9                	addw	a5,a5,a0
 3c0:	0017979b          	slliw	a5,a5,0x1
 3c4:	9fb1                	addw	a5,a5,a2
 3c6:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 3ca:	0006c603          	lbu	a2,0(a3)
 3ce:	fd06071b          	addiw	a4,a2,-48
 3d2:	0ff77713          	andi	a4,a4,255
 3d6:	fee5f1e3          	bgeu	a1,a4,3b8 <atoi+0x1e>
  return n;
}
 3da:	6422                	ld	s0,8(sp)
 3dc:	0141                	addi	sp,sp,16
 3de:	8082                	ret
  n = 0;
 3e0:	4501                	li	a0,0
 3e2:	bfe5                	j	3da <atoi+0x40>

00000000000003e4 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3e4:	1141                	addi	sp,sp,-16
 3e6:	e422                	sd	s0,8(sp)
 3e8:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ea:	00c05f63          	blez	a2,408 <memmove+0x24>
 3ee:	1602                	slli	a2,a2,0x20
 3f0:	9201                	srli	a2,a2,0x20
 3f2:	00c506b3          	add	a3,a0,a2
  dst = vdst;
 3f6:	87aa                	mv	a5,a0
    *dst++ = *src++;
 3f8:	0585                	addi	a1,a1,1
 3fa:	0785                	addi	a5,a5,1
 3fc:	fff5c703          	lbu	a4,-1(a1)
 400:	fee78fa3          	sb	a4,-1(a5)
  while(n-- > 0)
 404:	fed79ae3          	bne	a5,a3,3f8 <memmove+0x14>
  return vdst;
}
 408:	6422                	ld	s0,8(sp)
 40a:	0141                	addi	sp,sp,16
 40c:	8082                	ret

000000000000040e <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 40e:	4885                	li	a7,1
 ecall
 410:	00000073          	ecall
 ret
 414:	8082                	ret

0000000000000416 <exit>:
.global exit
exit:
 li a7, SYS_exit
 416:	4889                	li	a7,2
 ecall
 418:	00000073          	ecall
 ret
 41c:	8082                	ret

000000000000041e <wait>:
.global wait
wait:
 li a7, SYS_wait
 41e:	488d                	li	a7,3
 ecall
 420:	00000073          	ecall
 ret
 424:	8082                	ret

0000000000000426 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 426:	4891                	li	a7,4
 ecall
 428:	00000073          	ecall
 ret
 42c:	8082                	ret

000000000000042e <read>:
.global read
read:
 li a7, SYS_read
 42e:	4895                	li	a7,5
 ecall
 430:	00000073          	ecall
 ret
 434:	8082                	ret

0000000000000436 <write>:
.global write
write:
 li a7, SYS_write
 436:	48c1                	li	a7,16
 ecall
 438:	00000073          	ecall
 ret
 43c:	8082                	ret

000000000000043e <close>:
.global close
close:
 li a7, SYS_close
 43e:	48d5                	li	a7,21
 ecall
 440:	00000073          	ecall
 ret
 444:	8082                	ret

0000000000000446 <kill>:
.global kill
kill:
 li a7, SYS_kill
 446:	4899                	li	a7,6
 ecall
 448:	00000073          	ecall
 ret
 44c:	8082                	ret

000000000000044e <exec>:
.global exec
exec:
 li a7, SYS_exec
 44e:	489d                	li	a7,7
 ecall
 450:	00000073          	ecall
 ret
 454:	8082                	ret

0000000000000456 <open>:
.global open
open:
 li a7, SYS_open
 456:	48bd                	li	a7,15
 ecall
 458:	00000073          	ecall
 ret
 45c:	8082                	ret

000000000000045e <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 45e:	48c5                	li	a7,17
 ecall
 460:	00000073          	ecall
 ret
 464:	8082                	ret

0000000000000466 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 466:	48c9                	li	a7,18
 ecall
 468:	00000073          	ecall
 ret
 46c:	8082                	ret

000000000000046e <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 46e:	48a1                	li	a7,8
 ecall
 470:	00000073          	ecall
 ret
 474:	8082                	ret

0000000000000476 <link>:
.global link
link:
 li a7, SYS_link
 476:	48cd                	li	a7,19
 ecall
 478:	00000073          	ecall
 ret
 47c:	8082                	ret

000000000000047e <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 47e:	48d1                	li	a7,20
 ecall
 480:	00000073          	ecall
 ret
 484:	8082                	ret

0000000000000486 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 486:	48a5                	li	a7,9
 ecall
 488:	00000073          	ecall
 ret
 48c:	8082                	ret

000000000000048e <dup>:
.global dup
dup:
 li a7, SYS_dup
 48e:	48a9                	li	a7,10
 ecall
 490:	00000073          	ecall
 ret
 494:	8082                	ret

0000000000000496 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 496:	48ad                	li	a7,11
 ecall
 498:	00000073          	ecall
 ret
 49c:	8082                	ret

000000000000049e <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 49e:	48b1                	li	a7,12
 ecall
 4a0:	00000073          	ecall
 ret
 4a4:	8082                	ret

00000000000004a6 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 4a6:	48b5                	li	a7,13
 ecall
 4a8:	00000073          	ecall
 ret
 4ac:	8082                	ret

00000000000004ae <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 4ae:	48b9                	li	a7,14
 ecall
 4b0:	00000073          	ecall
 ret
 4b4:	8082                	ret

00000000000004b6 <ntas>:
.global ntas
ntas:
 li a7, SYS_ntas
 4b6:	48d9                	li	a7,22
 ecall
 4b8:	00000073          	ecall
 ret
 4bc:	8082                	ret

00000000000004be <crash>:
.global crash
crash:
 li a7, SYS_crash
 4be:	48dd                	li	a7,23
 ecall
 4c0:	00000073          	ecall
 ret
 4c4:	8082                	ret

00000000000004c6 <mount>:
.global mount
mount:
 li a7, SYS_mount
 4c6:	48e1                	li	a7,24
 ecall
 4c8:	00000073          	ecall
 ret
 4cc:	8082                	ret

00000000000004ce <umount>:
.global umount
umount:
 li a7, SYS_umount
 4ce:	48e5                	li	a7,25
 ecall
 4d0:	00000073          	ecall
 ret
 4d4:	8082                	ret

00000000000004d6 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 4d6:	1101                	addi	sp,sp,-32
 4d8:	ec06                	sd	ra,24(sp)
 4da:	e822                	sd	s0,16(sp)
 4dc:	1000                	addi	s0,sp,32
 4de:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 4e2:	4605                	li	a2,1
 4e4:	fef40593          	addi	a1,s0,-17
 4e8:	00000097          	auipc	ra,0x0
 4ec:	f4e080e7          	jalr	-178(ra) # 436 <write>
}
 4f0:	60e2                	ld	ra,24(sp)
 4f2:	6442                	ld	s0,16(sp)
 4f4:	6105                	addi	sp,sp,32
 4f6:	8082                	ret

00000000000004f8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f8:	7139                	addi	sp,sp,-64
 4fa:	fc06                	sd	ra,56(sp)
 4fc:	f822                	sd	s0,48(sp)
 4fe:	f426                	sd	s1,40(sp)
 500:	f04a                	sd	s2,32(sp)
 502:	ec4e                	sd	s3,24(sp)
 504:	0080                	addi	s0,sp,64
 506:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 508:	c299                	beqz	a3,50e <printint+0x16>
 50a:	0805c863          	bltz	a1,59a <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 50e:	2581                	sext.w	a1,a1
  neg = 0;
 510:	4881                	li	a7,0
 512:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 516:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 518:	2601                	sext.w	a2,a2
 51a:	00000517          	auipc	a0,0x0
 51e:	4ae50513          	addi	a0,a0,1198 # 9c8 <digits>
 522:	883a                	mv	a6,a4
 524:	2705                	addiw	a4,a4,1
 526:	02c5f7bb          	remuw	a5,a1,a2
 52a:	1782                	slli	a5,a5,0x20
 52c:	9381                	srli	a5,a5,0x20
 52e:	97aa                	add	a5,a5,a0
 530:	0007c783          	lbu	a5,0(a5)
 534:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 538:	0005879b          	sext.w	a5,a1
 53c:	02c5d5bb          	divuw	a1,a1,a2
 540:	0685                	addi	a3,a3,1
 542:	fec7f0e3          	bgeu	a5,a2,522 <printint+0x2a>
  if(neg)
 546:	00088b63          	beqz	a7,55c <printint+0x64>
    buf[i++] = '-';
 54a:	fd040793          	addi	a5,s0,-48
 54e:	973e                	add	a4,a4,a5
 550:	02d00793          	li	a5,45
 554:	fef70823          	sb	a5,-16(a4) # 1ff0 <__global_pointer$+0xe17>
 558:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 55c:	02e05863          	blez	a4,58c <printint+0x94>
 560:	fc040793          	addi	a5,s0,-64
 564:	00e78933          	add	s2,a5,a4
 568:	fff78993          	addi	s3,a5,-1
 56c:	99ba                	add	s3,s3,a4
 56e:	377d                	addiw	a4,a4,-1
 570:	1702                	slli	a4,a4,0x20
 572:	9301                	srli	a4,a4,0x20
 574:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 578:	fff94583          	lbu	a1,-1(s2)
 57c:	8526                	mv	a0,s1
 57e:	00000097          	auipc	ra,0x0
 582:	f58080e7          	jalr	-168(ra) # 4d6 <putc>
  while(--i >= 0)
 586:	197d                	addi	s2,s2,-1
 588:	ff3918e3          	bne	s2,s3,578 <printint+0x80>
}
 58c:	70e2                	ld	ra,56(sp)
 58e:	7442                	ld	s0,48(sp)
 590:	74a2                	ld	s1,40(sp)
 592:	7902                	ld	s2,32(sp)
 594:	69e2                	ld	s3,24(sp)
 596:	6121                	addi	sp,sp,64
 598:	8082                	ret
    x = -xx;
 59a:	40b005bb          	negw	a1,a1
    neg = 1;
 59e:	4885                	li	a7,1
    x = -xx;
 5a0:	bf8d                	j	512 <printint+0x1a>

00000000000005a2 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 5a2:	7119                	addi	sp,sp,-128
 5a4:	fc86                	sd	ra,120(sp)
 5a6:	f8a2                	sd	s0,112(sp)
 5a8:	f4a6                	sd	s1,104(sp)
 5aa:	f0ca                	sd	s2,96(sp)
 5ac:	ecce                	sd	s3,88(sp)
 5ae:	e8d2                	sd	s4,80(sp)
 5b0:	e4d6                	sd	s5,72(sp)
 5b2:	e0da                	sd	s6,64(sp)
 5b4:	fc5e                	sd	s7,56(sp)
 5b6:	f862                	sd	s8,48(sp)
 5b8:	f466                	sd	s9,40(sp)
 5ba:	f06a                	sd	s10,32(sp)
 5bc:	ec6e                	sd	s11,24(sp)
 5be:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 5c0:	0005c903          	lbu	s2,0(a1)
 5c4:	18090f63          	beqz	s2,762 <vprintf+0x1c0>
 5c8:	8aaa                	mv	s5,a0
 5ca:	8b32                	mv	s6,a2
 5cc:	00158493          	addi	s1,a1,1
  state = 0;
 5d0:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 5d2:	02500a13          	li	s4,37
      if(c == 'd'){
 5d6:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 5da:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 5de:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 5e2:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 5e6:	00000b97          	auipc	s7,0x0
 5ea:	3e2b8b93          	addi	s7,s7,994 # 9c8 <digits>
 5ee:	a839                	j	60c <vprintf+0x6a>
        putc(fd, c);
 5f0:	85ca                	mv	a1,s2
 5f2:	8556                	mv	a0,s5
 5f4:	00000097          	auipc	ra,0x0
 5f8:	ee2080e7          	jalr	-286(ra) # 4d6 <putc>
 5fc:	a019                	j	602 <vprintf+0x60>
    } else if(state == '%'){
 5fe:	01498f63          	beq	s3,s4,61c <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 602:	0485                	addi	s1,s1,1
 604:	fff4c903          	lbu	s2,-1(s1)
 608:	14090d63          	beqz	s2,762 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 60c:	0009079b          	sext.w	a5,s2
    if(state == 0){
 610:	fe0997e3          	bnez	s3,5fe <vprintf+0x5c>
      if(c == '%'){
 614:	fd479ee3          	bne	a5,s4,5f0 <vprintf+0x4e>
        state = '%';
 618:	89be                	mv	s3,a5
 61a:	b7e5                	j	602 <vprintf+0x60>
      if(c == 'd'){
 61c:	05878063          	beq	a5,s8,65c <vprintf+0xba>
      } else if(c == 'l') {
 620:	05978c63          	beq	a5,s9,678 <vprintf+0xd6>
      } else if(c == 'x') {
 624:	07a78863          	beq	a5,s10,694 <vprintf+0xf2>
      } else if(c == 'p') {
 628:	09b78463          	beq	a5,s11,6b0 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 62c:	07300713          	li	a4,115
 630:	0ce78663          	beq	a5,a4,6fc <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 634:	06300713          	li	a4,99
 638:	0ee78e63          	beq	a5,a4,734 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 63c:	11478863          	beq	a5,s4,74c <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 640:	85d2                	mv	a1,s4
 642:	8556                	mv	a0,s5
 644:	00000097          	auipc	ra,0x0
 648:	e92080e7          	jalr	-366(ra) # 4d6 <putc>
        putc(fd, c);
 64c:	85ca                	mv	a1,s2
 64e:	8556                	mv	a0,s5
 650:	00000097          	auipc	ra,0x0
 654:	e86080e7          	jalr	-378(ra) # 4d6 <putc>
      }
      state = 0;
 658:	4981                	li	s3,0
 65a:	b765                	j	602 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 65c:	008b0913          	addi	s2,s6,8
 660:	4685                	li	a3,1
 662:	4629                	li	a2,10
 664:	000b2583          	lw	a1,0(s6)
 668:	8556                	mv	a0,s5
 66a:	00000097          	auipc	ra,0x0
 66e:	e8e080e7          	jalr	-370(ra) # 4f8 <printint>
 672:	8b4a                	mv	s6,s2
      state = 0;
 674:	4981                	li	s3,0
 676:	b771                	j	602 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 678:	008b0913          	addi	s2,s6,8
 67c:	4681                	li	a3,0
 67e:	4629                	li	a2,10
 680:	000b2583          	lw	a1,0(s6)
 684:	8556                	mv	a0,s5
 686:	00000097          	auipc	ra,0x0
 68a:	e72080e7          	jalr	-398(ra) # 4f8 <printint>
 68e:	8b4a                	mv	s6,s2
      state = 0;
 690:	4981                	li	s3,0
 692:	bf85                	j	602 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 694:	008b0913          	addi	s2,s6,8
 698:	4681                	li	a3,0
 69a:	4641                	li	a2,16
 69c:	000b2583          	lw	a1,0(s6)
 6a0:	8556                	mv	a0,s5
 6a2:	00000097          	auipc	ra,0x0
 6a6:	e56080e7          	jalr	-426(ra) # 4f8 <printint>
 6aa:	8b4a                	mv	s6,s2
      state = 0;
 6ac:	4981                	li	s3,0
 6ae:	bf91                	j	602 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 6b0:	008b0793          	addi	a5,s6,8
 6b4:	f8f43423          	sd	a5,-120(s0)
 6b8:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 6bc:	03000593          	li	a1,48
 6c0:	8556                	mv	a0,s5
 6c2:	00000097          	auipc	ra,0x0
 6c6:	e14080e7          	jalr	-492(ra) # 4d6 <putc>
  putc(fd, 'x');
 6ca:	85ea                	mv	a1,s10
 6cc:	8556                	mv	a0,s5
 6ce:	00000097          	auipc	ra,0x0
 6d2:	e08080e7          	jalr	-504(ra) # 4d6 <putc>
 6d6:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6d8:	03c9d793          	srli	a5,s3,0x3c
 6dc:	97de                	add	a5,a5,s7
 6de:	0007c583          	lbu	a1,0(a5)
 6e2:	8556                	mv	a0,s5
 6e4:	00000097          	auipc	ra,0x0
 6e8:	df2080e7          	jalr	-526(ra) # 4d6 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 6ec:	0992                	slli	s3,s3,0x4
 6ee:	397d                	addiw	s2,s2,-1
 6f0:	fe0914e3          	bnez	s2,6d8 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 6f4:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 6f8:	4981                	li	s3,0
 6fa:	b721                	j	602 <vprintf+0x60>
        s = va_arg(ap, char*);
 6fc:	008b0993          	addi	s3,s6,8
 700:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 704:	02090163          	beqz	s2,726 <vprintf+0x184>
        while(*s != 0){
 708:	00094583          	lbu	a1,0(s2)
 70c:	c9a1                	beqz	a1,75c <vprintf+0x1ba>
          putc(fd, *s);
 70e:	8556                	mv	a0,s5
 710:	00000097          	auipc	ra,0x0
 714:	dc6080e7          	jalr	-570(ra) # 4d6 <putc>
          s++;
 718:	0905                	addi	s2,s2,1
        while(*s != 0){
 71a:	00094583          	lbu	a1,0(s2)
 71e:	f9e5                	bnez	a1,70e <vprintf+0x16c>
        s = va_arg(ap, char*);
 720:	8b4e                	mv	s6,s3
      state = 0;
 722:	4981                	li	s3,0
 724:	bdf9                	j	602 <vprintf+0x60>
          s = "(null)";
 726:	00000917          	auipc	s2,0x0
 72a:	29a90913          	addi	s2,s2,666 # 9c0 <malloc+0x154>
        while(*s != 0){
 72e:	02800593          	li	a1,40
 732:	bff1                	j	70e <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 734:	008b0913          	addi	s2,s6,8
 738:	000b4583          	lbu	a1,0(s6)
 73c:	8556                	mv	a0,s5
 73e:	00000097          	auipc	ra,0x0
 742:	d98080e7          	jalr	-616(ra) # 4d6 <putc>
 746:	8b4a                	mv	s6,s2
      state = 0;
 748:	4981                	li	s3,0
 74a:	bd65                	j	602 <vprintf+0x60>
        putc(fd, c);
 74c:	85d2                	mv	a1,s4
 74e:	8556                	mv	a0,s5
 750:	00000097          	auipc	ra,0x0
 754:	d86080e7          	jalr	-634(ra) # 4d6 <putc>
      state = 0;
 758:	4981                	li	s3,0
 75a:	b565                	j	602 <vprintf+0x60>
        s = va_arg(ap, char*);
 75c:	8b4e                	mv	s6,s3
      state = 0;
 75e:	4981                	li	s3,0
 760:	b54d                	j	602 <vprintf+0x60>
    }
  }
}
 762:	70e6                	ld	ra,120(sp)
 764:	7446                	ld	s0,112(sp)
 766:	74a6                	ld	s1,104(sp)
 768:	7906                	ld	s2,96(sp)
 76a:	69e6                	ld	s3,88(sp)
 76c:	6a46                	ld	s4,80(sp)
 76e:	6aa6                	ld	s5,72(sp)
 770:	6b06                	ld	s6,64(sp)
 772:	7be2                	ld	s7,56(sp)
 774:	7c42                	ld	s8,48(sp)
 776:	7ca2                	ld	s9,40(sp)
 778:	7d02                	ld	s10,32(sp)
 77a:	6de2                	ld	s11,24(sp)
 77c:	6109                	addi	sp,sp,128
 77e:	8082                	ret

0000000000000780 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 780:	715d                	addi	sp,sp,-80
 782:	ec06                	sd	ra,24(sp)
 784:	e822                	sd	s0,16(sp)
 786:	1000                	addi	s0,sp,32
 788:	e010                	sd	a2,0(s0)
 78a:	e414                	sd	a3,8(s0)
 78c:	e818                	sd	a4,16(s0)
 78e:	ec1c                	sd	a5,24(s0)
 790:	03043023          	sd	a6,32(s0)
 794:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 798:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 79c:	8622                	mv	a2,s0
 79e:	00000097          	auipc	ra,0x0
 7a2:	e04080e7          	jalr	-508(ra) # 5a2 <vprintf>
}
 7a6:	60e2                	ld	ra,24(sp)
 7a8:	6442                	ld	s0,16(sp)
 7aa:	6161                	addi	sp,sp,80
 7ac:	8082                	ret

00000000000007ae <printf>:

void
printf(const char *fmt, ...)
{
 7ae:	711d                	addi	sp,sp,-96
 7b0:	ec06                	sd	ra,24(sp)
 7b2:	e822                	sd	s0,16(sp)
 7b4:	1000                	addi	s0,sp,32
 7b6:	e40c                	sd	a1,8(s0)
 7b8:	e810                	sd	a2,16(s0)
 7ba:	ec14                	sd	a3,24(s0)
 7bc:	f018                	sd	a4,32(s0)
 7be:	f41c                	sd	a5,40(s0)
 7c0:	03043823          	sd	a6,48(s0)
 7c4:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 7c8:	00840613          	addi	a2,s0,8
 7cc:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 7d0:	85aa                	mv	a1,a0
 7d2:	4505                	li	a0,1
 7d4:	00000097          	auipc	ra,0x0
 7d8:	dce080e7          	jalr	-562(ra) # 5a2 <vprintf>
}
 7dc:	60e2                	ld	ra,24(sp)
 7de:	6442                	ld	s0,16(sp)
 7e0:	6125                	addi	sp,sp,96
 7e2:	8082                	ret

00000000000007e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7e4:	1141                	addi	sp,sp,-16
 7e6:	e422                	sd	s0,8(sp)
 7e8:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ea:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ee:	00000797          	auipc	a5,0x0
 7f2:	2027b783          	ld	a5,514(a5) # 9f0 <freep>
 7f6:	a805                	j	826 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 7f8:	4618                	lw	a4,8(a2)
 7fa:	9db9                	addw	a1,a1,a4
 7fc:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 800:	6398                	ld	a4,0(a5)
 802:	6318                	ld	a4,0(a4)
 804:	fee53823          	sd	a4,-16(a0)
 808:	a091                	j	84c <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 80a:	ff852703          	lw	a4,-8(a0)
 80e:	9e39                	addw	a2,a2,a4
 810:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 812:	ff053703          	ld	a4,-16(a0)
 816:	e398                	sd	a4,0(a5)
 818:	a099                	j	85e <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 81a:	6398                	ld	a4,0(a5)
 81c:	00e7e463          	bltu	a5,a4,824 <free+0x40>
 820:	00e6ea63          	bltu	a3,a4,834 <free+0x50>
{
 824:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 826:	fed7fae3          	bgeu	a5,a3,81a <free+0x36>
 82a:	6398                	ld	a4,0(a5)
 82c:	00e6e463          	bltu	a3,a4,834 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 830:	fee7eae3          	bltu	a5,a4,824 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 834:	ff852583          	lw	a1,-8(a0)
 838:	6390                	ld	a2,0(a5)
 83a:	02059813          	slli	a6,a1,0x20
 83e:	01c85713          	srli	a4,a6,0x1c
 842:	9736                	add	a4,a4,a3
 844:	fae60ae3          	beq	a2,a4,7f8 <free+0x14>
    bp->s.ptr = p->s.ptr;
 848:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 84c:	4790                	lw	a2,8(a5)
 84e:	02061593          	slli	a1,a2,0x20
 852:	01c5d713          	srli	a4,a1,0x1c
 856:	973e                	add	a4,a4,a5
 858:	fae689e3          	beq	a3,a4,80a <free+0x26>
  } else
    p->s.ptr = bp;
 85c:	e394                	sd	a3,0(a5)
  freep = p;
 85e:	00000717          	auipc	a4,0x0
 862:	18f73923          	sd	a5,402(a4) # 9f0 <freep>
}
 866:	6422                	ld	s0,8(sp)
 868:	0141                	addi	sp,sp,16
 86a:	8082                	ret

000000000000086c <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 86c:	7139                	addi	sp,sp,-64
 86e:	fc06                	sd	ra,56(sp)
 870:	f822                	sd	s0,48(sp)
 872:	f426                	sd	s1,40(sp)
 874:	f04a                	sd	s2,32(sp)
 876:	ec4e                	sd	s3,24(sp)
 878:	e852                	sd	s4,16(sp)
 87a:	e456                	sd	s5,8(sp)
 87c:	e05a                	sd	s6,0(sp)
 87e:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 880:	02051493          	slli	s1,a0,0x20
 884:	9081                	srli	s1,s1,0x20
 886:	04bd                	addi	s1,s1,15
 888:	8091                	srli	s1,s1,0x4
 88a:	0014899b          	addiw	s3,s1,1
 88e:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 890:	00000517          	auipc	a0,0x0
 894:	16053503          	ld	a0,352(a0) # 9f0 <freep>
 898:	c515                	beqz	a0,8c4 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 89c:	4798                	lw	a4,8(a5)
 89e:	02977f63          	bgeu	a4,s1,8dc <malloc+0x70>
 8a2:	8a4e                	mv	s4,s3
 8a4:	0009871b          	sext.w	a4,s3
 8a8:	6685                	lui	a3,0x1
 8aa:	00d77363          	bgeu	a4,a3,8b0 <malloc+0x44>
 8ae:	6a05                	lui	s4,0x1
 8b0:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 8b4:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 8b8:	00000917          	auipc	s2,0x0
 8bc:	13890913          	addi	s2,s2,312 # 9f0 <freep>
  if(p == (char*)-1)
 8c0:	5afd                	li	s5,-1
 8c2:	a895                	j	936 <malloc+0xca>
    base.s.ptr = freep = prevp = &base;
 8c4:	00008797          	auipc	a5,0x8
 8c8:	17478793          	addi	a5,a5,372 # 8a38 <base>
 8cc:	00000717          	auipc	a4,0x0
 8d0:	12f73223          	sd	a5,292(a4) # 9f0 <freep>
 8d4:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 8d6:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 8da:	b7e1                	j	8a2 <malloc+0x36>
      if(p->s.size == nunits)
 8dc:	02e48c63          	beq	s1,a4,914 <malloc+0xa8>
        p->s.size -= nunits;
 8e0:	4137073b          	subw	a4,a4,s3
 8e4:	c798                	sw	a4,8(a5)
        p += p->s.size;
 8e6:	02071693          	slli	a3,a4,0x20
 8ea:	01c6d713          	srli	a4,a3,0x1c
 8ee:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 8f0:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 8f4:	00000717          	auipc	a4,0x0
 8f8:	0ea73e23          	sd	a0,252(a4) # 9f0 <freep>
      return (void*)(p + 1);
 8fc:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 900:	70e2                	ld	ra,56(sp)
 902:	7442                	ld	s0,48(sp)
 904:	74a2                	ld	s1,40(sp)
 906:	7902                	ld	s2,32(sp)
 908:	69e2                	ld	s3,24(sp)
 90a:	6a42                	ld	s4,16(sp)
 90c:	6aa2                	ld	s5,8(sp)
 90e:	6b02                	ld	s6,0(sp)
 910:	6121                	addi	sp,sp,64
 912:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 914:	6398                	ld	a4,0(a5)
 916:	e118                	sd	a4,0(a0)
 918:	bff1                	j	8f4 <malloc+0x88>
  hp->s.size = nu;
 91a:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 91e:	0541                	addi	a0,a0,16
 920:	00000097          	auipc	ra,0x0
 924:	ec4080e7          	jalr	-316(ra) # 7e4 <free>
  return freep;
 928:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 92c:	d971                	beqz	a0,900 <malloc+0x94>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92e:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 930:	4798                	lw	a4,8(a5)
 932:	fa9775e3          	bgeu	a4,s1,8dc <malloc+0x70>
    if(p == freep)
 936:	00093703          	ld	a4,0(s2)
 93a:	853e                	mv	a0,a5
 93c:	fef719e3          	bne	a4,a5,92e <malloc+0xc2>
  p = sbrk(nu * sizeof(Header));
 940:	8552                	mv	a0,s4
 942:	00000097          	auipc	ra,0x0
 946:	b5c080e7          	jalr	-1188(ra) # 49e <sbrk>
  if(p == (char*)-1)
 94a:	fd5518e3          	bne	a0,s5,91a <malloc+0xae>
        return 0;
 94e:	4501                	li	a0,0
 950:	bf45                	j	900 <malloc+0x94>
