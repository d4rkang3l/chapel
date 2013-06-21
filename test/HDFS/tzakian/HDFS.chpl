use SysBasic; // For c_types 

// TODO
//extern type tSize = int(32);

// Record returned by HDFS
extern record chadoopFileInfo {
	var mLastMod: int(32);
	var mSize: int(64);
	var mReplication: int(16);
	var mBlockSize: int(64);
	var mPermissions: int(16);
	var mLastAccess: int(32);
}

/* chadoop.h */
extern const IS_NULL_FALSE: c_int; // To see if it is null from 
extern const IS_NULL_TRUE: c_int;

extern proc printBlockHosts_C(b: c_ptr, l: string);

extern proc IS_NULL(ptr: c_ptr): c_int;

extern proc chadoopFree(ptr: c_ptr);
extern proc chadoopFreeString(str: string);

extern proc chadoopGetFileInfo(hdfsFS: c_ptr, path: string): chadoopFileInfo;

extern proc chadoopGetBlockCount(hostBlocks: c_ptr): int(32);
extern proc chadoopGetHostCount(hostBlocks: c_ptr, block: int(32)): int(32);
extern proc chadoopGetHost(hostBlocks: c_ptr, block: int(32), host: int(32)): string;

extern proc chadoopReadFile(hdfsFS: c_ptr, hdfsFile: c_ptr, length: int(32)): string;
extern proc chadoopReadFilePositional(hdfsFS: c_ptr, hdfsFile: c_ptr, position: int(64), length: int(32)): string;

/* libhdfs */

extern proc hdfsCloseFile(hdfsFS: c_ptr, hdfsFile: c_ptr): c_int;

/* Returns hdfsFS */
extern proc hdfsConnect(nn: string, port: c_int): c_ptr;

/* Returns tOffset (int64) */
extern proc hdfsGetDefaultBlockSize(hdfsFS: c_ptr): int(64);

extern proc hdfsFlush(hdfsFS: c_ptr, hdfsFile: c_ptr): c_int;

/* Returns char*** -- see chadoopGetHosts/Blocks for more info */
extern proc hdfsGetHosts(hdfsFS: c_ptr, path: string, start: int(64), length: int(64)): c_ptr;

/* Returns hdfsFile */
extern proc hdfsOpenFile(hdfsFS: c_ptr, path: string, flags: c_int, bufferSize: c_int, replication: int(16), blocksize: int(32)): c_ptr;

/* Returns tSize (int32) */
extern proc hdfsWrite(hdfsFS: c_ptr, hdfsFile: c_ptr, buffer: string, length: int(32)): int(32);

