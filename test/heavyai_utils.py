import heavyai
import pandas as pd
from time import perf_counter
import os

SSB_QUERIES = ['1.1', '1.2', '1.3', '2.1', '2.2', '2.3', '3.1', '3.2', '3.3', '4.1', '4.2', '4.3']
SSB_CUSTOM_QUERIES = ['1', '2', '3', '4', '5', '6', '7', '8', '9']


class HeavyAITester:

    def __init__(self, database_name: str, verbose: bool = False) -> None:
        """
        Args:
            database_name: database name to connect
            verbose: enable verbose logging (False by default)
        """
        self.connection = heavyai.connect(
            user="admin",
            password="HyperInteractive",
            host="localhost",
            dbname=database_name,
        )
        self.verbose = verbose

    def close_connection(self) -> None:
        """
        This should explicitly be called to close connection!
        """
        self.connection.close()

    def run_query(self, query_path: str) -> float:
        """
        Args:
            query_path: sql query file path
        Returns:
            runtime of query
        """
        assert os.path.exists(query_path), "Query file does not exist"

        with open(query_path, "r") as queryfile:
            query = queryfile.read()

            try:
                if self.verbose:
                    print(f"Start query {query_path} ... ", end="")
                pstart = perf_counter()
                df = self.connection.select_ipc(query)
                pend = perf_counter()
                if self.verbose:
                    print(f"success! Elapsed time: {pend - pstart}")
            except Exception as e:
                print(e)
                print(f"{query_path} failed")
                return -1

        return pend - pstart
    
    def run_ssb_qnum(self, qnum: str) -> float:
        """
        Args:
            qnum: ssb query number in format 'x.y'
        Returns:
            runtime of query
        """

        qpath = (
            "/home/klee965/src/db_multi_gpu/ssb/queries/"
            + "q"
            + qnum
            + ".sql"
        )

        return self.run_query(qpath)
    
    def run_ssb_custom_qnum(self, qnum: str) -> float:
        """
        Args:
            qnum: ssb query number in format 'n'
        Returns:
            runtime of query
        """

        qpath = (
            "/home/klee965/src/db_multi_gpu/ssb/queries/custom/"
            + "q"
            + qnum
            + ".sql"
        )

        return self.run_query(qpath)
    
    def run_ssb_all(self) -> dict:
        """
        Args:
            None
        Returns:
            dictionary of query number : runtime
        """
        result = {}

        for qnum in SSB_QUERIES:
            result[qnum] = self.run_ssb_qnum(qnum)

        return result

    def run_ssb_custom_all(self) -> dict:
        """
        Args:
            None
        Returns:
            dictionary of query number : runtime
        """
        result = {}

        for qnum in SSB_CUSTOM_QUERIES:
            result[qnum] = self.run_ssb_custom_qnum(qnum)

        return result
    
    def run_tpch_qnum(self, qnum: int) -> float:
        """
        Args:
            qnum: tpch query number within [1, 22] inclusive
        Returns:
            runtime of query
        """
        assert qnum > 0, "Invalid TPC-H query number"
        assert qnum < 23, "Invalid TPC-H query number"

        snum = str(qnum)

        if qnum < 10:
            snum = "0" + snum

        qpath = (
            "/home/klee965/src/db_multi_gpu/tpch/queries-rewritten/"
            + "Q"
            + snum
            + ".sql"
        )

        return self.run_query(qpath)
    
    def run_tpch_batch(self, qnums) -> dict:
        """
        Args:
            None
        Returns:
            dictionary of query number : runtime
        """
        result = {}

        for qnum in qnums:
            result[qnum] = self.run_tpch_qnum(qnum)

        return result

    def run_tpch_all(self) -> dict:
        """
        Args:
            None
        Returns:
            dictionary of query number : runtime
        """
        result = {}

        for qnum in range(1, 23):
            result[qnum] = self.run_tpch_qnum(qnum)

        return result
