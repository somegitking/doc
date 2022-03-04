select
 la.lano,
 la.lno,
 la.mno,
 date_format(la.rdt, '%y-%m-%d') reg_date,
 l.titl
 from lect_appl la
 inner join lect l on la.lno = l.lno;

 select
  la.lano,
  la.mno,
  date_format(la.rdt, '%y-%m-%d') reg_date,
  l.titl
  name
  from lect_appl la
  inner join lect l on la.lno = l.lno
  inner join memb m on la.mno =.m.mno;

  select
   la.lano,
   date_format(la.rdt, '%y-%m-%d') reg_date,
   l.titl,
   m.name
   from lect_appl la
   inner join lect l on la.lno = l.lno
   inner join memb m on la.mno = m.mno;


   select
    la.lano,
    date_format(la.rdt, '%y-%m-%d') reg_date,
    l.titl,
    m.name,
    s.work
    from lect_appl la
    inner join lect l on la.lno = l.lno
    inner join memb m on la.mno =m.mno
    inner join stnt s on la.mno =s.mno;

    select
     la.lano,
     date_format(la.rdt, '%y-%m-%d') reg_date,
     l.titl,
     m.name,
     s.work,
     r.name
     from lect_appl la
     inner join lect l on la.lno = l.lno
     inner join memb m on la.mno =m.mno
     inner join stnt s on la.mno =s.mno
     left outer join room r on l.rno = r.rno;

     select
      la.lano,
      /*date_format(la.rdt, '%y-%m-%d') reg_date,*/
      to_char(la.rdt, 'YYYY_MM-DD') reg_date,
      l.titl,
      m.name,
      s.work,
      coalesce(r.name, ' ') room_name
      from lect_appl la
      inner join lect l on la.lno = l.lno
      inner join memb m on la.mno =m.mno
      inner join stnt s on la.mno =s.mno
      left outer join room r on l.rno = r.rno;


      select
       la.lano,
       /*date_format(la.rdt, '%y-%m-%d') reg_date,*/
       to_char(la.rdt, 'YYYY_MM-DD') reg_date,
       l.titl,
       m.name as student_name,
       s.work,
       coalesce(r.name, ' ') room_name,
       coalesce(m2.name, ' ')  manager_name
       from lect_appl la
       inner join lect l on la.lno = l.lno
       inner join memb m on la.mno =m.mno
       inner join stnt s on la.mno =s.mno
       left outer join room r on l.rno = r.rno
       left outer join memb m2 on l.mno = m2.mno;

 select
  la.lano,
  /*date_format(la.rdt, '%y-%m-%d') reg_date,*/
  to_char(la.rdt, 'YYYY_MM-DD') reg_date,
  l.titl,
  m.name as student_name,
  s.work,
  ifnull(r.name, ' ') room_name,
  ifnull(m2.name, ' ')  manager_name,
  ifnull(mr.posi, '') manager_posi
  from lect_appl la
  inner join lect l on la.lno = l.lno
  inner join memb m on la.mno =m.mno
  inner join stnt s on la.mno =s.mno
  left outer join room r on l.rno = r.rno
  left outer join memb m2 on l.mno = m2.mno
  left outer join mgr mr on l.mno = mr.mno;


  select
    la.lano,
    la.lno,
    la.mno,
    to_char(la.rdt, 'YYY-MM-DD')reg_date
  from lect_appl la;

  select
    la.lano,
    (select titl from lect where lno=la.lno) lect_title,
    la.mno,
    to_char(la.rdt, 'YYY-MM-DD')reg_date
  from lect_appl la;

  select
    la.lano,
    (select titl from lect where lno=la.lno) lect_title,
    (select name from memb where mno=la.mno) member_name,
    (select work from stnt where mno=la.mno) member_work,
    to_char(la.rdt, 'YYY-MM-DD')reg_date,
    ifnull((select name from room where rno=(select rno from lect where lno=la.lno)), '')room_name,
    ifnull((select name from memb where mno=(select mno from lect where lno=la.lno)), '')room_name,
    ifnull((select posi from mgr where mno =(select mno from lect where lno=la.lno)), '')manager_posi
  from lect_appl la;

  select
    l.titl lect_title,
    l.rno,
    l.mno
    from lect l;

select
  l.lno lect_no,
  l.titl lect_title,
  ifnull((select name from room where rno=l.rno),'')room_name,
  ifnull((select name from memb where mno=l.mno),'')manager_name,
  l.rno,
  l.mno
  from lect l;

  select
    l.lno lect_no,
    l.titl lect_title,
    ifnull((select name from room where rno=l.rno),'')room_name,
    ifnull((select name from memb where mno=l.mno),'')manager_name,
    ifnull((select posi from mgr where mno=l.mno), '') mgr_posi,
    l.rno,
    l.mno
    from lect l;

select
 s.mno std_no,
 (select name from memb where mno-s.mno) student_name,
 s.work std_work
 from
 stnt s;

select
 la.lano,
 la.lno,
 la.mno,
 to_char(la.rdt, 'YYYY-MM-DD')reg_date
 from lect_appl la;

 select
  la.lano,
  lect_title,
  room_name,
  mgr_name,
  mgr_posi,
  la.mno,
  to_char(la.rdt, 'YYYY-MM-DD')reg_date
  from lect_appl la;
inner join(
  select
    l.lno lect_no,
    l.titl lect_title,
    ifnull((select name from room where rno=l.rno),'')room_name,
    ifnull((select name from memb where mno=l.mno),'')manager_name,
    ifnull((select posi from mgr where mno=l.mno), '') mgr_posi,
    l.rno,
    l.mno
    from lect l

)le on la.lno=lect_no;
