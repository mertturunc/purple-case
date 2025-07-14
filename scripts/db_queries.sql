--raneming the demographic data (it was a mess)
ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_04" TO "male_0_4";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_1014" TO "male_10_14";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_1519" TO "male_15_19";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_2024" TO "male_20_24";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_2529" TO "male_25_29";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_3034" TO "male_30_34";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_3539" TO "male_35_39";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_4044" TO "male_40_44";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_4549" TO "male_45_49";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_5054" TO "male_50_54";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_5559" TO "male_55_59";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_59" TO "male_5_9";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_6064" TO "male_60_64";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_6569" TO "male_65_69";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_7074" TO "male_70_74";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_7579" TO "male_75_79";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_8084" TO "male_80_84";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_8589" TO "male_85_89";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Erkek_ve_90" TO "male_90_plus";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_04" TO "female_0_4";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_1014" TO "female_10_14";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_1519" TO "female_15_19";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_2024" TO "female_20_24";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_2529" TO "female_25_29";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_3034" TO "female_30_34";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_3539" TO "female_35_39";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_4044" TO "female_40_44";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_4549" TO "female_45_49";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_5054" TO "female_50_54";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_5559" TO "female_55_59";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_59" TO "female_5_9";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_6064" TO "female_60_64";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_6569" TO "female_65_69";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_7074" TO "female_70_74";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_7579" TO "female_75_79";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_8084" TO "female_80_84";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_8589" TO "female_85_89";

ALTER TABLE public.district_with_age 
    RENAME COLUMN "Kadın_ve_90" TO "female_90_plus";
