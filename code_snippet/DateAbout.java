// 判定时间 是否在某个时间区间内
    private static boolean isInTheRange(Date start, Date end, Date it) {
        if (it.getTime() >= start.getTime() && it.getTime() <= end.getTime()) {
            return true;
        } else {
            return false;
        }

    }

    // 计算两个日期之间相差的天数
    public static int differentDaysByMillisecond(Date date1, Date date2)
    {
        if (date1.getTime() > date2.getTime()) {
            return 0;
        }
        int days = (int) ((date2.getTime() - date1.getTime()) / (1000*3600*24));
        return days + 1;
    }

    // 返回某个月的最后一天
    public static Date lastDayOfMonth(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.roll(Calendar.DAY_OF_MONTH, -1);
        return cal.getTime();
    }

    // 返回某天的最后一秒 yyyy-MM-dd 23:59:59
    public static Date getLastSecondOfTheDay(Date date)  throws Exception {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");

        Date res =format.parse(format.format(formatYMD.parse(formatYMD.format(date)).getTime() + (1000 * 3600 * 24 - 1000)));
        return res;
    }
