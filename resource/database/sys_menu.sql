-- Table: public.sys_menu

-- DROP TABLE IF EXISTS public.sys_menu;

CREATE TABLE IF NOT EXISTS public.sys_menu
(
    id integer NOT NULL DEFAULT nextval('sys_menu_id_seq'::regclass),
    parent_id integer NOT NULL DEFAULT 0,
    path character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    redirect character varying(255) COLLATE pg_catalog."default",
    component character varying(255) COLLATE pg_catalog."default",
    title character varying(100) COLLATE pg_catalog."default",
    is_full boolean DEFAULT false,
    hide boolean DEFAULT false,
    disable boolean DEFAULT false,
    keep_alive boolean DEFAULT false,
    affix boolean DEFAULT false,
    link character varying(500) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    iframe boolean DEFAULT false,
    svg_icon character varying(100) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    icon character varying(100) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    sort integer DEFAULT 0,
    type smallint DEFAULT 2,
    is_link boolean DEFAULT false,
    permission character varying(255) COLLATE pg_catalog."default" DEFAULT ''::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone,
    created_by integer,
    CONSTRAINT sys_menu_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.sys_menu
    OWNER to postgres;

COMMENT ON TABLE public.sys_menu
    IS '系统菜单路由表';

COMMENT ON COLUMN public.sys_menu.id
    IS '路由ID';

COMMENT ON COLUMN public.sys_menu.parent_id
    IS '父级路由ID，顶层为0';

COMMENT ON COLUMN public.sys_menu.path
    IS '路由路径';

COMMENT ON COLUMN public.sys_menu.name
    IS '路由名称';

COMMENT ON COLUMN public.sys_menu.redirect
    IS '重定向';

COMMENT ON COLUMN public.sys_menu.component
    IS '组件文件路径';

COMMENT ON COLUMN public.sys_menu.title
    IS '菜单标题，国际化key';

COMMENT ON COLUMN public.sys_menu.is_full
    IS '是否全屏显示：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.hide
    IS '是否隐藏：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.disable
    IS '是否停用：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.keep_alive
    IS '是否缓存：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.affix
    IS '是否固定：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.link
    IS '外链地址';

COMMENT ON COLUMN public.sys_menu.iframe
    IS '是否内嵌：0-否，1-是';

COMMENT ON COLUMN public.sys_menu.svg_icon
    IS 'svg图标名称';

COMMENT ON COLUMN public.sys_menu.icon
    IS '普通图标名称';

COMMENT ON COLUMN public.sys_menu.sort
    IS '排序字段';

COMMENT ON COLUMN public.sys_menu.type
    IS '类型：1-目录，2-菜单，3-按钮';

COMMENT ON COLUMN public.sys_menu.is_link
    IS '是否外链';

COMMENT ON COLUMN public.sys_menu.permission
    IS '权限标识';

COMMENT ON COLUMN public.sys_menu.created_at
    IS '创建时间';

COMMENT ON COLUMN public.sys_menu.updated_at
    IS '更新时间';

COMMENT ON COLUMN public.sys_menu.deleted_at
    IS '删除时间';

COMMENT ON COLUMN public.sys_menu.created_by
    IS '创建人';
-- Index: idx_parent_id

-- DROP INDEX IF EXISTS public.idx_parent_id;

CREATE INDEX IF NOT EXISTS idx_parent_id
    ON public.sys_menu USING btree
    (parent_id ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_sort

-- DROP INDEX IF EXISTS public.idx_sort;

CREATE INDEX IF NOT EXISTS idx_sort
    ON public.sys_menu USING btree
    (sort ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;
-- Index: idx_type

-- DROP INDEX IF EXISTS public.idx_type;

CREATE INDEX IF NOT EXISTS idx_type
    ON public.sys_menu USING btree
    (type ASC NULLS LAST)
    WITH (fillfactor=100, deduplicate_items=True)
    TABLESPACE pg_default;